var DataTypes = require("sequelize").DataTypes;
var _abogado = require("./abogado");
var _calificacion = require("./calificacion");
var _usuario = require("./usuario");

function initModels(sequelize) {
  var abogado = _abogado(sequelize, DataTypes);
  var calificacion = _calificacion(sequelize, DataTypes);
  var usuario = _usuario(sequelize, DataTypes);

  abogado.belongsToMany(usuario, { as: 'id_usuario_usuarios', through: calificacion, foreignKey: "id_abogado", otherKey: "id_usuario" });
  usuario.belongsToMany(abogado, { as: 'id_abogado_abogados', through: calificacion, foreignKey: "id_usuario", otherKey: "id_abogado" });
  calificacion.belongsTo(abogado, { as: "id_abogado_abogado", foreignKey: "id_abogado"});
  abogado.hasMany(calificacion, { as: "calificacions", foreignKey: "id_abogado"});
  abogado.belongsTo(usuario, { as: "id_usuario_usuario", foreignKey: "id_usuario"});
  usuario.hasMany(abogado, { as: "abogados", foreignKey: "id_usuario"});
  calificacion.belongsTo(usuario, { as: "id_usuario_usuario", foreignKey: "id_usuario"});
  usuario.hasMany(calificacion, { as: "calificacions", foreignKey: "id_usuario"});

  return {
    abogado,
    calificacion,
    usuario,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
