module Exam::Geometric

  def maxillary_depth_angle
    return nil if self.point_po.x.nil? or self.point_po.y.nil? or self.point_or.x.nil? or self.point_or.y.nil? or self.point_n.x.nil? or self.point_n.y.nil? or self.point_a.x.nil? or self.point_a.y.nil?
    calc_positivo?
  end

  private
    def slope_straight_line x1,y1,x2,y2
      #calcula coeficente algular da reta
      Geometry::Line[[x1,y1],[x2,y2]].slope
    end

    def theta
      #define o valor de theta aplicando modulo para não ficar negativo
      ((slope_straight_line(self.point_po.x,self.point_po.y,self.point_or.x,self.point_or.y) - slope_straight_line(self.point_n.x,self.point_n.y,self.point_a.x,self.point_a.y))/(1 + slope_straight_line(point_po.x,point_po.y,point_or.x,point_or.y)*slope_straight_line(point_n.x,point_n.y,point_a.x,point_a.y))).abs
    end

    def degrees
      #calcula a tangente de theta e converte para angulo
      convert_angle Math.atan(theta) 
    end

    def convert_angle angle
      angle*180/Math::PI
    end

    def calc_positivo?
      #verificar se o produto dos coeficientes é negativo, se for inverte o angulo de retorno(angulos maiores de 90)
      (slope_straight_line(self.point_po.x,self.point_po.y,self.point_or.x,self.point_or.y) * slope_straight_line(self.point_n.x,self.point_n.y,self.point_a.x,self.point_a.y)).positive? ? degrees : 180 - degrees
    end

end