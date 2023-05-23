package com.example.dao

import com.example.models.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.select

interface DAOCampo {
    suspend fun allCampos(): List<Campo>
    suspend fun campo(id: Int): Campo?
    suspend fun campoart(seasonId: Int): Campo?
    suspend fun addNewCampos(value: String, name: String, description: String, seasonId: Int, order: Int): Campo?
    suspend fun editCampos(id: Int, value: String, name: String, description: String, seasonId: Int, order: Int): Boolean
    suspend fun deleteCampos(id: Int): Boolean
}