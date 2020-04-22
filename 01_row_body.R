menu_row <- tabItem(tabName = "row",
                    fluidRow(
                      column(width = 4,
                             box(
                               title = "上传品牌车型", width = NULL, solidHeader = TRUE, status = "primary",
                               mdl_file('file_brandCartype','上传品牌车型文件')
                               ,actionButton('btn_carType','预览品牌车型数据')
                               ,actionButton('upload_carType','上传服务器')
                               ,use_pop()
                             )
                            
                      ),
                      
                      column(width = 8,
                             box(
                               title = "车型数据预览", width = NULL, solidHeader = TRUE, status = "primary",
                              mdl_dataTable('pre_carType')
                             )
                      )
                    )
)
