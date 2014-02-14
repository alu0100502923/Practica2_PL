var assert = chai.assert;

suite('CSV Tests', function() {
	test('Comprobar valores', function() {
		original.value = "\"Nombre\",\"Apellido\"\n\"Juan\",\"Oliva\"";
		calculate();
		assert.deepEqual(result.innerHTML, "\n<tbody><tr>\t<td>Nombre</td>\t<td>Apellido</td></tr>\n<tr>\t<td>Juan</td>\t<td>Oliva</td></tr>\n</tbody>");
	});
	test('Detectar errores', function() {
		original.value = "\"Nombre\" \"Apellido\"\n\"Pepe\"";
		calculate();
		assert.isNotNull(result.innerHTML.match(/class=\"error\"/));
	});
	test('Detectar acierto', function() {
		original.value = "\"Nombre\",\"Apellido\"\n\"Juan\",\"Oliva\"";
		calculate();
		assert.isNull(result.innerHTML.match(/class=\"error\"/));
	});
});