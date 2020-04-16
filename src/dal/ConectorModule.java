package dal;
//importa a classe de manipulaçao de sql
import java.sql.*;





public class ConectorModule {
    
//
    public static Connection conect() {
        //Variavel de conexao
        java.sql.Connection conn = null;
        
        //Driver de conexao
        String driver = "com.mysql.jdbc.Driver";
        
        //novo nome do banco de dados 
        String url = "jdbc:mysql://localhost:3306/mygames2";
        
        //usuario e senha do mwql
        String user = "root";
        String passwd = "";
        
        // Conexao mysql
        
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, passwd);
            return conn;
            } catch (Exception e){
//Testes               
// System.out.println(e);
                
                
                return null;
            }
        
    }
    
}
