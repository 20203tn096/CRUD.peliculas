package mx.com.movie.model;

import mx.com.movie.service.ConnectionMySQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoMovie {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    public List<BeanMovie> findAllMovies(){
        List<BeanMovie> listMovies = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call find_movie}");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanMovie beanMovie = new BeanMovie();
                beanMovie.setId(rs.getInt("idMovie"));
                beanMovie.setName(rs.getString("name"));
                beanMovie.setDescription(rs.getString("description"));
                beanMovie.setPremiereDate(rs.getString("premiereDate"));
                beanMovie.setCollection(rs.getDouble("collection"));
                beanMovie.setStatus(rs.getInt("status"));

                listMovies.add(beanMovie);
            }
        }catch (SQLException e){
            System.out.println("Ha ocurrido un error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnection(con, cstm, rs);
        }
        return listMovies;
    }
    public boolean update(BeanMovie movie){
        boolean flag = false;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_update(?,?,?,?,?)}");
            cstm.setInt(1, movie.getId());
            cstm.setString(2, movie.getName());
            cstm.setString(3, movie.getDescription());
            cstm.setString(4, movie.getPremiereDate());
            cstm.setDouble(5, movie.getCollection());

            flag = cstm.execute();
        }catch(SQLException e){
            System.out.println("Ha ocurrido un error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;
    }
    public boolean create(BeanMovie movie){
        boolean flag = false;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_create(?,?,?,?)}");
            cstm.setString(1, movie.getName());
            cstm.setString(2, movie.getDescription());
            cstm.setString(3, movie.getPremiereDate());
            cstm.setDouble(4, movie.getCollection());

            cstm.execute();
            flag = true;
        }catch(SQLException e){
            System.out.println("Ha ocurrido un error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;
    }
    public boolean delete(int idMovie){
        boolean flag = false;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call sp_delete(?)}");
            cstm.setInt(1, idMovie);

            flag = cstm.execute();
        }catch(SQLException e){
            System.out.println("Ha ocurrido un error: " + e.getMessage());
        }finally{
            ConnectionMySQL.closeConnection(con, cstm);
        }
        return flag;
    }
}
