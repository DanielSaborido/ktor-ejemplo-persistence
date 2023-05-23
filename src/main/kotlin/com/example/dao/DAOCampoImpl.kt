package com.example.dao

import com.example.dao.DatabaseFactory.dbQuery
import com.example.models.Campo
import com.example.models.Campos
import kotlinx.coroutines.runBlocking
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq

val daoCampo: DAOCampo = DAOCampoImpl().apply {
    runBlocking {
        if(allCampos().isEmpty()) {
            addNewCampos("Valor", "Nombre", "Descripcion", 1, 1)
        }
    }
}

class DAOCampoImpl : DAOCampo {
    private fun resultRowToEntity(row: ResultRow) = Campo(
        id = row[Campos.id],
        value = row[Campos.value],
        name = row[Campos.name],
        description = row[Campos.description],
        seasonId = row[Campos.seasonId],
        order = row[Campos.order]
    )
    override suspend fun allCampos(): List<Campo> = dbQuery {
        Campos.selectAll().map(::resultRowToEntity)
    }

    override suspend fun campo(id: Int): Campo? = dbQuery {
        Campos
            .select { Campos.id eq id }
            .map(::resultRowToEntity)
            .singleOrNull()
    }

    override suspend fun campoart(seasonId: Int): Campo? = dbQuery {
        Campos
            .select { Campos.seasonId eq seasonId }
            .map(::resultRowToEntity)
            .singleOrNull()
    }

    override suspend fun addNewCampos(
        value: String,
        name: String,
        description: String,
        seasonId: Int,
        order: Int
    ): Campo? = dbQuery {
        val insertStatement = Campos.insert {
            it[Campos.value] = value
            it[Campos.name] = name
            it[Campos.description] = description
            it[Campos.seasonId] = seasonId
            it[Campos.order] = order
        }
        insertStatement.resultedValues?.singleOrNull()?.let(::resultRowToEntity)
    }

    override suspend fun editCampos(
        id: Int,
        value: String,
        name: String,
        description: String,
        seasonId: Int,
        order: Int
    ): Boolean = dbQuery {
        Campos.update({ Campos.id eq id }) {
            it[Campos.value] = value
            it[Campos.name] = name
            it[Campos.description] = description
            it[Campos.seasonId] = seasonId
            it[Campos.order] = order
        } > 0
    }

    override suspend fun deleteCampos(id: Int): Boolean = dbQuery {
        Campos.deleteWhere { Campos.id eq id } > 0
    }
}