const { syncDB } = require('../../tasks/sync-db');

describe('Pruebas en Sync-DB', () => {

    test('syncDB debe incrementar times y retornar el valor actualizado', () => {
        syncDB();
        const times = syncDB();
        expect(times).toBe(2);
    });

});
