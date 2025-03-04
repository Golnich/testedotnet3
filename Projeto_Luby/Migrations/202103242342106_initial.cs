﻿namespace Golnich_Horas.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class initial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.DESENVOLVEDORES",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        NOME = c.String(),
                        LINGUAGEM = c.String(),
                        HORARIO = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.DESENVOLVEDORES");
        }
    }
}
