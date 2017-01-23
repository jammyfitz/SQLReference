begin transaction t1
Exec ta_spp_InsertIPConfigBulkLoad
      @UserNames = 'M73497XML,MK1642XML',
      @UserNameDelimiter = ',',  
      @IPStart = '', 
      @IPEnd  = '',
      @RequestedBy = 'JF',
      @CreatedBy = 'JF',
      @UpdatedBy = 'JF',
      @Comments = ''
commit transaction

