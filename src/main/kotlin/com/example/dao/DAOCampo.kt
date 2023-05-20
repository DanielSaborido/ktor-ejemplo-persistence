package com.example.dao

import com.example.models.*

interface DAOCampo {
    suspend fun allCampos(): List<Campo>
    suspend fun campo(id: Int): Campo?
    suspend fun addNewCampos(value: String, name: String, description: String, seasonId: Int, order: Int): Campo?
    suspend fun editCampos(id: Int, value: String, name: String, description: String, seasonId: Int, order: Int): Boolean
    suspend fun deleteCampos(id: Int): Boolean
}