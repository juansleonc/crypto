if defined?(Bullet)
  Bullet.enable = true
  Bullet.alert = true
  Bullet.bullet_logger = true
  Bullet.console = true
  # Bullet.growl = true
  Bullet.rails_logger = true
  Bullet.add_footer = true
  Bullet.skip_html_injection = false
  # Detecta consultas N+1
  Bullet.n_plus_one_query_enable = true
  # Detecta cuando se está cargando innecesariamente una asociación
  Bullet.unused_eager_loading_enable = true
  # Detecta el uso de counter cache
  Bullet.counter_cache_enable = true
end
