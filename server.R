

#shinyserver start point----
 shinyServer(function(input, output,session) {
   
   var_file_cartype <- var_file('file_brandCartype')
   
   
   data_carType <- eventReactive(input$btn_carType,{
      file <- var_file_cartype()
      res <- readCartype(file)
      return(res)
   })
   
   data_carType_db <- eventReactive(input$btn_carType,{
      file <- var_file_cartype()
      res <- readCartype_db(file)
      return(res)
   })
   
   run_dataTable2('pre_carType',data_carType()) 
   #上传服务器
   
   observeEvent(input$upload_carType,{
      upload_data(conn=conn,table_name = 't_md_carType',data=data_carType_db())
      pop_notice('已上传服务器')
      
   }
                )
   
   
   
   #修改车型
   
   carType <- getCarType()
   print(carType)
   dtedit2(input, output,
           name = 'editCarType',
           thedata = carType,
           edit.cols = c('FBrandName','FCartypeName','FBusiObj_like','FBusiOjb_same'),
           edit.label.cols = c('品牌','车型','业务对象(近义词)','业务对象(同义词)'),
           input.types = c(FBusiOjb_same='textAreaInput'),
           #input.choices = list(FNUMBER = unique(unlist(books$FNUMBER))),
           view.cols = c('FBrandName','FCartypeName','FBusiObj_like','FBusiOjb_same'),
           view.captions = c('品牌','车型','业务对象(近义词)','业务对象(同义词)'),
           callback.update = carType.update.callback,
           callback.insert = carType.insert.callback,
           callback.delete = carType.delete.callback)
   
   
  
})
