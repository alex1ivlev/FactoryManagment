# FactoryManagment
Technion project 1

Option to open from windows (default) :
in Web.config connection sting is different

under : <connection string> first in windows shoud be : 
    <add name="Factory_Managment_DBEntities" connectionString="metadata=~/bin/Models\FactoryDB.csdl|~/bin/Models\FactoryDB.ssdl|~/bin/Models\FactoryDB.msl;provider=System.Data.SqlClient;provider connection string='data source=TCWD-TCNP\SQLEXPRESS;initial catalog=&quot;Factory Managment DB&quot;;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework'" providerName="System.Data.EntityClient" />
second link should be :
  
  <add name="Factory_Managment_DBEntitiesLinux" connectionString="metadata=./bin/Models/FactoryDB.csdl|./bin/Models/FactoryDB.ssdl|./bin/Models/FactoryDB.msl;provider=System.Data.SqlClient;provider connection string='data source=localhost;initial catalog=&quot;Factory Managment DB&quot;;User Id=sa;Password=alex@1234;MultipleActiveResultSets=True;App=EntityFramework'" providerName="System.Data.EntityClient" />
to operate from linux : 
the second link should be activated: 
    <add name="Factory_Managment_DBEntities" connectionString="metadata=./bin/Models/FactoryDB.csdl|./bin/Models/FactoryDB.ssdl|./bin/Models/FactoryDB.msl;provider=System.Data.SqlClient;provider connection string='data source=localhost;initial catalog=&quot;Factory Managment DB&quot;;User Id=sa;Password=alex@1234;MultipleActiveResultSets=True;App=EntityFramework'" providerName="System.Data.EntityClient" />
in  the first :
    <add name="Factory_Managment_DBEntitiesWindows" connectionString="metadata=~/bin/Models\FactoryDB.csdl|~/bin/Models\FactoryDB.ssdl|~/bin/Models\FactoryDB.msl;provider=System.Data.SqlClient;provider connection string='data source=TCWD-TCNP\SQLEXPRESS;initial catalog=&quot;Factory Managment DB&quot;;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework'" providerName="System.Data.EntityClient" />

Factory Managment system to operate the employees and employee shifts.
