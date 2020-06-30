package se.iuh.btl.config;

import java.sql.Types;

import org.hibernate.dialect.SQLServerDialect;

public class UnicodeSQLServerDialect extends SQLServerDialect {
	public UnicodeSQLServerDialect() {
		registerColumnType(Types.VARCHAR, "nvarchar(max)");
	}
}
