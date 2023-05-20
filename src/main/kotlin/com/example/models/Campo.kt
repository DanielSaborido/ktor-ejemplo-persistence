package com.example.models

import org.jetbrains.exposed.sql.*

data class Campo(val id: Int, val value: String, val name: String, val description: String, val seasonId: Int, val order: Int)

object Campos : Table(){
    val id = integer("id").autoIncrement()
    val value = varchar("valor", 1024)
    val name = varchar("nombre", 128)
    val description = varchar("descripcion", 256)
    val seasonId = reference("idtemporada", Articles.id)
    val order = integer("orden")

    override val primaryKey = PrimaryKey(id)
}