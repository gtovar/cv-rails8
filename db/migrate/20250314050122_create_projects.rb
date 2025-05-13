class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string  :name, null: false                          # Nombre del proyecto (Ej: "Finovaria")
      t.date    :start_time, null: false                    # Fecha de inicio (Ej: "2023-01-01")
      t.date    :end_time                                   # Fecha de término (Ej: "2023-12-31")
      t.string  :position, null: false                      # Rol o cargo (Ej: "Desarrollador Fullstack")
      t.text    :activities                                 # Lista o resumen de actividades principales
      t.text    :outstanding                                # Logros o resultados destacados (Ej: "Reduje el tiempo de carga en 50%")
      t.text    :tools                                      # Herramientas utilizadas (Ej: "Ruby on Rails, PostgreSQL, Docker")
      t.text    :description                                # Descripción narrativa general del proyecto
      t.text    :activity_description                       # Detalle adicional por si se requiere exponer narrativa larga
      t.string  :cover                                      # URL o nombre del archivo para imagen destacada
      t.string  :logo                                       # Logo del cliente, empresa o marca
      t.string  :category                                   # Clasificación: freelance, empleo, personal, etc.
      t.string  :slug, index: { unique: true }              # Slug para URLs amigables (Ej: "finovaria-ai")
      t.string  :link                                       # Enlace al proyecto online, repositorio, demo, etc.
      t.boolean :actual, default: false, null: false        # Si el proyecto sigue en curso (Ej: true para uno actual)

      t.references :resume, null: false, foreign_key: true  # Asociación al currículum (Resume)

      t.timestamps
    end
  end
end
