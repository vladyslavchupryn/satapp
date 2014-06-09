package ua.pp.chuprin.servlets.satapp;

import org.omg.CORBA.ServerRequest;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.Closeable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class DAO {

    public static String content(String code) {
        PreparedStatement stmt = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = getDataSource().getConnection();
            stmt = conn.prepareStatement("SELECT content FROM pages WHERE code = ?");
            stmt.setString(1, code);

            rs = stmt.executeQuery();
            while (rs.next()) {
                return rs.getString("content");
            }

            return null;
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            close(conn, stmt, rs);
        }
    }

    public static void save(String code, String content) {
        PreparedStatement stmt = null;
        Connection conn = null;
        try {
            conn = getDataSource().getConnection();
            stmt = conn.prepareStatement("UPDATE pages SET content = ? WHERE code = ?");
            stmt.setString(1, content);
            stmt.setString(2, code);

            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new IllegalStateException(e);
        } finally {
            close(conn, stmt);
        }
    }

    private static void close(Connection conn, List<? extends Statement> stmt, List<ResultSet> rs) {
        for (ResultSet closeable : rs) {
            try {
                if(closeable != null) {
                    closeable.close();
                }
            } catch (SQLException se2) {
                throw new IllegalStateException(se2);
            }
        }

        for (Statement closeable : stmt) {
            try {
                if(closeable != null) {
                    closeable.close();
                }
            } catch (SQLException se2) {
                throw new IllegalStateException(se2);
            }
        }

        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }

    private static DataSource getDataSource() {
        DataSource pool = null;
        try {
            Context ctx = new InitialContext();
            pool = (DataSource)ctx.lookup("java:comp/env/jdbc/satappdb");
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return pool;
    }

    private static void close(Connection conn, Statement stmt) {
        close(conn, Arrays.asList(stmt), Collections.<ResultSet>emptyList());
    }

    private static void close(Connection conn, Statement stmt, ResultSet rs) {
        close(conn, Arrays.asList(stmt), Arrays.asList(rs));
    }
}
