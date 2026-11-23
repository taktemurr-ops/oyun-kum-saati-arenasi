import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kum_saati_arenasi/oyun_kum_saati_arenasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kumSaatiArenasiConfig.title.length, 33);
    expect(kumSaatiArenasiConfig.tagline.length, 33);
    for (final s in kumSaatiArenasiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kumSaatiArenasiConfig.gameId, kumSaatiArenasiId);
    expect(kumSaatiArenasiRules.gameId, kumSaatiArenasiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kumSaatiArenasiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kumSaatiArenasiId, optionalMechanics: kumSaatiArenasiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kumSaatiArenasiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
