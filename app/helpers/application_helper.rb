module ApplicationHelper
     def estado_html(estado)
          if estado 
               'Activo'
          else
               'Inactivo'
          end
     end
end
