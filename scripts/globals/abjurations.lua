-----------------------------------
-- Abjurations
-- Used by Alphollon C Meriard
-----------------------------------
require('scripts/globals/items')
-----------------------------------

xi = xi or {}

xi.abjurations =
{
    -- (5 IDs/lines per transaction)
    --  abjuration,
    --  item,
    --  item -1,
    --  nq reward,
    --  hq reward

    xi.items.LIBATION_ABJURATION,
    xi.items.BOTTLE_OF_CURSED_BEVERAGE,
    xi.items.BOTTLE_OF_CURSED_BEVERAGE,
    xi.items.BOTTLE_OF_AMRITA,
    xi.items.BOTTLE_OF_AMRITA,

    xi.items.OBLATION_ABJURATION,
    xi.items.BOWL_OF_CURSED_SOUP,
    xi.items.BOWL_OF_CURSED_SOUP,
    xi.items.BOWL_OF_AMBROSIA,
    xi.items.BOWL_OF_AMBROSIA,

    xi.items.DRYADIC_ABJURATION_HEAD,
    xi.items.CURSED_KABUTO,
    xi.items.CURSED_KABUTO_M1,
    xi.items.SHURA_ZUNARI_KABUTO,
    xi.items.SHURA_ZUNARI_KABUTO_P1,

    xi.items.DRYADIC_ABJURATION_BODY,
    xi.items.CURSED_TOGI,
    xi.items.CURSED_TOGI_M1,
    xi.items.SHURA_TOGI,
    xi.items.SHURA_TOGI_P1,

    xi.items.DRYADIC_ABJURATION_HANDS,
    xi.items.CURSED_KOTE,
    xi.items.CURSED_KOTE_M1,
    xi.items.SHURA_KOTE,
    xi.items.SHURA_KOTE_P1,

    xi.items.DRYADIC_ABJURATION_LEGS,
    xi.items.CURSED_HAIDATE,
    xi.items.CURSED_HAIDATE_M1,
    xi.items.SHURA_HAIDATE,
    xi.items.SHURA_HAIDATE_P1,

    xi.items.DRYADIC_ABJURATION_FEET,
    xi.items.CURSED_SUNE_ATE,
    xi.items.CURSED_SUNE_ATE_M1,
    xi.items.SHURA_SUNE_ATE,
    xi.items.SHURA_SUNE_ATE_P1,

    xi.items.EARTHEN_ABJURATION_HEAD,
    xi.items.CURSED_CELATA,
    xi.items.CURSED_CELATA_M1,
    xi.items.ADAMAN_CELATA,
    xi.items.ARMADA_CELATA,

    xi.items.EARTHEN_ABJURATION_BODY,
    xi.items.CURSED_HAUBERK,
    xi.items.CURSED_HAUBERK_M1,
    xi.items.ADAMAN_HAUBERK,
    xi.items.ARMADA_HAUBERK,

    xi.items.EARTHEN_ABJURATION_HANDS,
    xi.items.CURSED_MUFFLERS,
    xi.items.CURSED_MUFFLERS_M1,
    xi.items.ADAMAN_MUFFLERS,
    xi.items.ARMADA_MUFFLERS,

    xi.items.EARTHEN_ABJURATION_LEGS,
    xi.items.CURSED_BREECHES,
    xi.items.CURSED_BREECHES_M1,
    xi.items.ADAMAN_BREECHES,
    xi.items.ARMADA_BREECHES,

    xi.items.EARTHEN_ABJURATION_FEET,
    xi.items.CURSED_SOLLERETS,
    xi.items.CURSED_SOLLERETS_M1,
    xi.items.ADAMAN_SOLLERETS,
    xi.items.ARMADA_SOLLERETS,

    xi.items.AQUARIAN_ABJURATION_HEAD,
    xi.items.CURSED_CROWN,
    xi.items.CURSED_CROWN_M1,
    xi.items.ZENITH_CROWN,
    xi.items.ZENITH_CROWN_P1,

    xi.items.AQUARIAN_ABJURATION_BODY,
    xi.items.CURSED_DALMATICA,
    xi.items.CURSED_DALMATICA_M1,
    xi.items.DALMATICA,
    xi.items.DALMATICA_P1,

    xi.items.AQUARIAN_ABJURATION_HANDS,
    xi.items.CURSED_MITTS,
    xi.items.CURSED_MITTS_M1,
    xi.items.ZENITH_MITTS,
    xi.items.ZENITH_MITTS_P1,

    xi.items.AQUARIAN_ABJURATION_LEGS,
    xi.items.CURSED_SLACKS,
    xi.items.CURSED_SLACKS_M1,
    xi.items.ZENITH_SLACKS,
    xi.items.ZENITH_SLACKS_P1,

    xi.items.AQUARIAN_ABJURATION_FEET,
    xi.items.CURSED_PUMPS,
    xi.items.CURSED_PUMPS_M1,
    xi.items.ZENITH_PUMPS,
    xi.items.ZENITH_PUMPS_P1,

    xi.items.MARTIAL_ABJURATION_HEAD,
    xi.items.CURSED_SCHALLER,
    xi.items.CURSED_SCHALLER_M1,
    xi.items.KOENIG_SCHALLER,
    xi.items.KAISER_SCHALLER,

    xi.items.MARTIAL_ABJURATION_BODY,
    xi.items.CURSED_CUIRASS,
    xi.items.CURSED_CUIRASS_M1,
    xi.items.KOENIG_CUIRASS,
    xi.items.KAISER_CUIRASS,

    xi.items.MARTIAL_ABJURATION_HANDS,
    xi.items.CURSED_HANDSCHUHS,
    xi.items.CURSED_HANDSCHUHS_M1,
    xi.items.KOENIG_HANDSCHUHS,
    xi.items.KAISER_HANDSCHUHS,

    xi.items.MARTIAL_ABJURATION_LEGS,
    xi.items.CURSED_DIECHLINGS,
    xi.items.CURSED_DIECHLINGS_M1,
    xi.items.KOENIG_DIECHLINGS,
    xi.items.KAISER_DIECHLINGS,

    xi.items.MARTIAL_ABJURATION_FEET,
    xi.items.CURSED_SCHUHS,
    xi.items.CURSED_SCHUHS_M1,
    xi.items.KOENIG_SCHUHS,
    xi.items.KAISER_SCHUHS,

    xi.items.WYRMAL_ABJURATION_HEAD,
    xi.items.CURSED_MASK,
    xi.items.CURSED_MASK_M1,
    xi.items.CRIMSON_MASK,
    xi.items.BLOOD_MASK,

    xi.items.WYRMAL_ABJURATION_BODY,
    xi.items.CURSED_MAIL,
    xi.items.CURSED_MAIL_M1,
    xi.items.CRIMSON_SCALE_MAIL,
    xi.items.BLOOD_SCALE_MAIL,

    xi.items.WYRMAL_ABJURATION_HANDS,
    xi.items.CURSED_FINGER_GAUNTLETS,
    xi.items.CURSED_FINGER_GAUNTLETS_M1,
    xi.items.CRIMSON_FINGER_GAUNTLETS,
    xi.items.BLOOD_FINGER_GAUNTLETS,

    xi.items.WYRMAL_ABJURATION_LEGS,
    xi.items.CURSED_CUISSES,
    xi.items.CURSED_CUISSES_M1,
    xi.items.CRIMSON_CUISSES,
    xi.items.BLOOD_CUISSES,

    xi.items.WYRMAL_ABJURATION_FEET,
    xi.items.CURSED_GREAVES,
    xi.items.CURSED_GREAVES_M1,
    xi.items.CRIMSON_GREAVES,
    xi.items.BLOOD_GREAVES,

    xi.items.NEPTUNAL_ABJURATION_HEAD,
    xi.items.CURSED_CAP,
    xi.items.CURSED_CAP_M1,
    xi.items.HECATOMB_CAP,
    xi.items.HECATOMB_CAP_P1,

    xi.items.NEPTUNAL_ABJURATION_BODY,
    xi.items.CURSED_HARNESS,
    xi.items.CURSED_HARNESS_M1,
    xi.items.HECATOMB_HARNESS,
    xi.items.HECATOMB_HARNESS_P1,

    xi.items.NEPTUNAL_ABJURATION_HANDS,
    xi.items.CURSED_GLOVES,
    xi.items.CURSED_GLOVES_M1,
    xi.items.HECATOMB_MITTENS,
    xi.items.HECATOMB_MITTENS_P1,

    xi.items.NEPTUNAL_ABJURATION_LEGS,
    xi.items.CURSED_SUBLIGAR,
    xi.items.CURSED_SUBLIGAR_M1,
    xi.items.HECATOMB_SUBLIGAR,
    xi.items.HECATOMB_SUBLIGAR_P1,

    xi.items.NEPTUNAL_ABJURATION_FEET,
    xi.items.CURSED_LEGGINGS,
    xi.items.CURSED_LEGGINGS_M1,
    xi.items.HECATOMB_LEGGINGS,
    xi.items.HECATOMB_LEGGINGS_P1,

    xi.items.PHANTASMAL_ABJURATION_HEAD,
    xi.items.CURSED_HELM,
    xi.items.CURSED_HELM_M1,
    xi.items.SHADOW_HELM,
    xi.items.VALKYRIES_HELM,

    xi.items.PHANTASMAL_ABJURATION_BODY,
    xi.items.CURSED_BREASTPLATE,
    xi.items.CURSED_BREASTPLATE_M1,
    xi.items.SHADOW_BREASTPLATE,
    xi.items.VALKYRIES_BREASTPLATE,

    xi.items.PHANTASMAL_ABJURATION_HANDS,
    xi.items.CURSED_GAUNTLETS,
    xi.items.CURSED_GAUNTLETS_M1,
    xi.items.SHADOW_GAUNTLETS,
    xi.items.VALKYRIES_GAUNTLETS,

    xi.items.PHANTASMAL_ABJURATION_LEGS,
    xi.items.CURSED_CUISHES,
    xi.items.CURSED_CUISHES_M1,
    xi.items.SHADOW_CUISHES,
    xi.items.VALKYRIES_CUISHES,

    xi.items.PHANTASMAL_ABJURATION_FEET,
    xi.items.CURSED_SABATONS,
    xi.items.CURSED_SABATONS_M1,
    xi.items.SHADOW_SABATONS,
    xi.items.VALKYRIES_SABATONS,

    xi.items.HADEAN_ABJURATION_HEAD,
    xi.items.CURSED_HAT,
    xi.items.CURSED_HAT_M1,
    xi.items.SHADOW_HAT,
    xi.items.VALKYRIES_HAT,

    xi.items.HADEAN_ABJURATION_BODY,
    xi.items.CURSED_COAT,
    xi.items.CURSED_COAT_M1,
    xi.items.SHADOW_COAT,
    xi.items.VALKYRIES_COAT,

    xi.items.HADEAN_ABJURATION_HANDS,
    xi.items.CURSED_CUFFS,
    xi.items.CURSED_CUFFS_M1,
    xi.items.SHADOW_CUFFS,
    xi.items.VALKYRIES_CUFFS,

    xi.items.HADEAN_ABJURATION_LEGS,
    xi.items.CURSED_TREWS,
    xi.items.CURSED_TREWS_M1,
    xi.items.SHADOW_TREWS,
    xi.items.VALKYRIES_TREWS,

    xi.items.HADEAN_ABJURATION_FEET,
    xi.items.CURSED_CLOGS,
    xi.items.CURSED_CLOGS_M1,
    xi.items.SHADOW_CLOGS,
    xi.items.VALKYRIES_CLOGS,

    xi.items.CORVINE_ABJURATION_HEAD,
    xi.items.HEXED_CORONET,
    xi.items.HEXED_CORONET_M1,
    xi.items.HRAFN_CORONET,
    xi.items.HUGINN_CORONET,

    xi.items.CORVINE_ABJURATION_BODY,
    xi.items.HEXED_HAUBERT,
    xi.items.HEXED_HAUBERT_M1,
    xi.items.HRAFN_HAUBERT,
    xi.items.HUGINN_HAUBERT,

    xi.items.CORVINE_ABJURATION_HANDS,
    xi.items.HEXED_GAUNTLETS,
    xi.items.HEXED_GAUNTLETS_M1,
    xi.items.HRAFN_GAUNTLETS,
    xi.items.HUGINN_GAUNTLETS,

    xi.items.CORVINE_ABJURATION_LEGS,
    xi.items.HEXED_HOSE,
    xi.items.HEXED_HOSE_M1,
    xi.items.HRAFN_HOSE,
    xi.items.HUGINN_HOSE,

    xi.items.CORVINE_ABJURATION_FEET,
    xi.items.HEXED_GAMBIERAS,
    xi.items.HEXED_GAMBIERAS_M1,
    xi.items.HRAFN_GAMBIERAS,
    xi.items.HUGINN_GAMBIERAS,

    xi.items.FOREBODING_ABJURATION_HEAD,
    xi.items.HEXED_COIF,
    xi.items.HEXED_COIF_M1,
    xi.items.AUSPEX_COIF,
    xi.items.SPURRINA_COIF,

    xi.items.FOREBODING_ABJURATION_BODY,
    xi.items.HEXED_DOUBLET,
    xi.items.HEXED_DOUBLET_M1,
    xi.items.AUSPEX_DOUBLET,
    xi.items.SPURRINA_DOUBLET,

    xi.items.FOREBODING_ABJURATION_HANDS,
    xi.items.HEXED_GAGES,
    xi.items.HEXED_GAGES_M1,
    xi.items.AUSPEX_GAGES,
    xi.items.SPURRINA_GAGES,

    xi.items.FOREBODING_ABJURATION_LEGS,
    xi.items.HEXED_SLOPS,
    xi.items.HEXED_SLOPS_M1,
    xi.items.AUSPEX_SLOPS,
    xi.items.SPURRINA_SLOPS,

    xi.items.FOREBODING_ABJURATION_FEET,
    xi.items.HEXED_NAILS,
    xi.items.HEXED_NAILS_M1,
    xi.items.AUSPEX_NAILS,
    xi.items.SPURRINA_NAILS,

    xi.items.LENITIVE_ABJURATION_HEAD,
    xi.items.HEXED_MITRA,
    xi.items.HEXED_MITRA_M1,
    xi.items.PAEAN_MITRA,
    xi.items.IASO_MITRA,

    xi.items.LENITIVE_ABJURATION_BODY,
    xi.items.HEXED_BLIAUT,
    xi.items.HEXED_BLIAUT_M1,
    xi.items.PAEAN_BLIAUT,
    xi.items.IASO_BLIAUT,

    xi.items.LENITIVE_ABJURATION_HANDS,
    xi.items.HEXED_CUFFS,
    xi.items.HEXED_CUFFS_M1,
    xi.items.PAEAN_CUFFS,
    xi.items.IASO_CUFFS,

    xi.items.LENITIVE_ABJURATION_LEGS,
    xi.items.HEXED_TIGHTS,
    xi.items.HEXED_TIGHTS_M1,
    xi.items.PAEAN_TIGHTS,
    xi.items.IASO_TIGHTS,

    xi.items.LENITIVE_ABJURATION_FEET,
    xi.items.HEXED_BOOTS,
    xi.items.HEXED_BOOTS_M1,
    xi.items.PAEAN_BOOTS,
    xi.items.IASO_BOOTS,

    xi.items.SUPERNAL_ABJURATION_HEAD,
    xi.items.HEXED_SOMEN,
    xi.items.HEXED_SOMEN_M1,
    xi.items.TENRYU_SOMEN,
    xi.items.TENRYU_SOMEN_P1,

    xi.items.SUPERNAL_ABJURATION_BODY,
    xi.items.HEXED_DOMARU,
    xi.items.HEXED_DOMARU_M1,
    xi.items.TENRYU_DOMARU,
    xi.items.TENRYU_DOMARU_P1,

    xi.items.SUPERNAL_ABJURATION_HANDS,
    xi.items.HEXED_TEKKO,
    xi.items.HEXED_TEKKO_M1,
    xi.items.TENRYU_TEKKO,
    xi.items.TENRYU_TEKKO_P1,

    xi.items.SUPERNAL_ABJURATION_LEGS,
    xi.items.HEXED_HAKAMA,
    xi.items.HEXED_HAKAMA_M1,
    xi.items.TENRYU_HAKAMA,
    xi.items.TENRYU_HAKAMA_P1,

    xi.items.SUPERNAL_ABJURATION_FEET,
    xi.items.HEXED_SUNE_ATE,
    xi.items.HEXED_SUNE_ATE_M1,
    xi.items.TENRYU_SUNE_ATE,
    xi.items.TENRYU_SUNE_ATE_P1,

    xi.items.TRANSITORY_ABJURATION_HEAD,
    xi.items.HEXED_BONNET,
    xi.items.HEXED_BONNET_M1,
    xi.items.KHEPER_BONNET,
    xi.items.KHEPRI_BONNET,

    xi.items.TRANSITORY_ABJURATION_BODY,
    xi.items.HEXED_JACKET,
    xi.items.HEXED_JACKET_M1,
    xi.items.KHEPER_JACKET,
    xi.items.KHEPRI_JACKET,

    xi.items.TRANSITORY_ABJURATION_HANDS,
    xi.items.HEXED_WRISTBANDS,
    xi.items.HEXED_WRISTBANDS_M1,
    xi.items.KHEPER_WRISTBANDS,
    xi.items.KHEPRI_WRISTBANDS,

    xi.items.TRANSITORY_ABJURATION_LEGS,
    xi.items.HEXED_KECKS,
    xi.items.HEXED_KECKS_M1,
    xi.items.KHEPER_KECKS,
    xi.items.KHEPRI_KECKS,

    xi.items.TRANSITORY_ABJURATION_FEET,
    xi.items.HEXED_GAMASHES,
    xi.items.HEXED_GAMASHES_M1,
    xi.items.KHEPER_GAMASHES,
    xi.items.KHEPRI_GAMASHES,

    xi.items.ABYSSAL_ABJURATION_HEAD,
    xi.items.BEWITCHED_CROWN,
    xi.items.VOODOO_CROWN,
    xi.items.APOGEE_CROWN,
    xi.items.APOGEE_CROWN_P1,

    xi.items.ABYSSAL_ABJURATION_BODY,
    xi.items.BEWITCHED_DALMATICA,
    xi.items.VOODOO_DALMATICA,
    xi.items.APOGEE_DALMATICA,
    xi.items.APOGEE_DALMATICA_P1,

    xi.items.ABYSSAL_ABJURATION_HANDS,
    xi.items.BEWITCHED_MITTS,
    xi.items.VOODOO_MITTS,
    xi.items.APOGEE_MITTS,
    xi.items.APOGEE_MITTS_P1,

    xi.items.ABYSSAL_ABJURATION_LEGS,
    xi.items.BEWITCHED_SLACKS,
    xi.items.VOODOO_SLACKS,
    xi.items.APOGEE_SLACKS,
    xi.items.APOGEE_SLACKS_P1,

    xi.items.ABYSSAL_ABJURATION_FEET,
    xi.items.BEWITCHED_PUMPS,
    xi.items.VOODOO_PUMPS,
    xi.items.APOGEE_PUMPS,
    xi.items.APOGEE_PUMPS_P1,

    xi.items.AREAN_ABJURATION_HEAD,
    xi.items.VEXED_SOMEN,
    xi.items.JINXED_SOMEN,
    xi.items.RYUO_SOMEN,
    xi.items.RYUO_SOMEN_P1,

    xi.items.AREAN_ABJURATION_BODY,
    xi.items.VEXED_DOMARU,
    xi.items.JINXED_DOMARU,
    xi.items.RYUO_DOMARU,
    xi.items.RYUO_DOMARU_P1,

    xi.items.AREAN_ABJURATION_HANDS,
    xi.items.VEXED_KOTE,
    xi.items.JINXED_KOTE,
    xi.items.RYUO_TEKKO,
    xi.items.RYUO_TEKKO_P1,

    xi.items.AREAN_ABJURATION_LEGS,
    xi.items.VEXED_HAKAMA,
    xi.items.JINXED_HAKAMA,
    xi.items.RYUO_HAKAMA,
    xi.items.RYUO_HAKAMA_P1,

    xi.items.AREAN_ABJURATION_FEET,
    xi.items.VEXED_SUNE_ATE,
    xi.items.JINXED_SUNE_ATE,
    xi.items.RYUO_SUNE_ATE,
    xi.items.RYUO_SUNE_ATE_P1,

    xi.items.BUSHIN_ABJURATION_HEAD,
    xi.items.BEWITCHED_SCHALLER,
    xi.items.VOODOO_SCHALLER,
    xi.items.SOUVERAN_SCHALLER,
    xi.items.SOUVERAN_SCHALLER_P1,

    xi.items.BUSHIN_ABJURATION_BODY,
    xi.items.BEWITCHED_CUIRASS,
    xi.items.VOODOO_CUIRASS,
    xi.items.SOUVERAN_CUIRASS,
    xi.items.SOUVERAN_CUIRASS_P1,

    xi.items.BUSHIN_ABJURATION_HANDS,
    xi.items.BEWITCHED_HANDSCHUHS,
    xi.items.VOODOO_HANDSCHUHS,
    xi.items.SOUVERAN_HANDSCHUHS,
    xi.items.SOUVERAN_HANDSCHUHS_P1,

    xi.items.BUSHIN_ABJURATION_LEGS,
    xi.items.BEWITCHED_DIECHLINGS,
    xi.items.VOODOO_DIECHLINGS,
    xi.items.SOUVERAN_DIECHLINGS,
    xi.items.SOUVERAN_DIECHLINGS_P1,

    xi.items.BUSHIN_ABJURATION_FEET,
    xi.items.BEWITCHED_SCHUHS,
    xi.items.VOODOO_SCHUHS,
    xi.items.SOUVERAN_SCHUHS,
    xi.items.SOUVERAN_SCHUHS_P1,

    xi.items.CRONIAN_ABJURATION_HEAD,
    xi.items.VEXED_CORONET,
    xi.items.JINXED_CORONET,
    xi.items.EMICHO_CORONET,
    xi.items.EMICHO_CORONET_P1,

    xi.items.CRONIAN_ABJURATION_BODY,
    xi.items.VEXED_HAUBERT,
    xi.items.JINXED_HAUBERT,
    xi.items.EMICHO_HAUBERT,
    xi.items.EMICHO_HAUBERT_P1,

    xi.items.CRONIAN_ABJURATION_HANDS,
    xi.items.VEXED_GAUNTLETS,
    xi.items.JINXED_GAUNTLETS,
    xi.items.EMICHO_GAUNTLETS,
    xi.items.EMICHO_GAUNTLETS_P1,

    xi.items.CRONIAN_ABJURATION_LEGS,
    xi.items.VEXED_HOSE,
    xi.items.JINXED_HOSE,
    xi.items.EMICHO_HOSE,
    xi.items.EMICHO_HOSE_P1,

    xi.items.CRONIAN_ABJURATION_FEET,
    xi.items.VEXED_GAMBIERAS,
    xi.items.JINXED_GAMBIERAS,
    xi.items.EMICHO_GAMBIERAS,
    xi.items.EMICHO_GAMBIERAS_P1,

    xi.items.CYLLENIAN_ABJURATION_HEAD,
    xi.items.VEXED_MITRA,
    xi.items.JINXED_MITRA,
    xi.items.KAYKAUS_MITRA,
    xi.items.KAYKAUS_MITRA_P1,

    xi.items.CYLLENIAN_ABJURATION_BODY,
    xi.items.VEXED_BLIAUT,
    xi.items.JINXED_BLIAUT,
    xi.items.KAYKAUS_BLIAUT,
    xi.items.KAYKAUS_BLIAUT_P1,

    xi.items.CYLLENIAN_ABJURATION_HANDS,
    xi.items.VEXED_CUFFS,
    xi.items.JINXED_CUFFS,
    xi.items.KAYKAUS_CUFFS,
    xi.items.KAYKAUS_CUFFS_P1,

    xi.items.CYLLENIAN_ABJURATION_LEGS,
    xi.items.VEXED_TIGHTS,
    xi.items.JINXED_TIGHTS,
    xi.items.KAYKAUS_TIGHTS,
    xi.items.KAYKAUS_TIGHTS_P1,

    xi.items.CYLLENIAN_ABJURATION_FEET,
    xi.items.VEXED_BOOTS,
    xi.items.JINXED_BOOTS,
    xi.items.KAYKAUS_BOOTS,
    xi.items.KAYKAUS_BOOTS_P1,

    xi.items.GROVE_ABJURATION_HEAD,
    xi.items.BEWITCHED_KABUTO,
    xi.items.VOODOO_KABUTO,
    xi.items.RAO_KABUTO,
    xi.items.RAO_KABUTO_P1,

    xi.items.GROVE_ABJURATION_BODY,
    xi.items.BEWITCHED_TOGI,
    xi.items.VOODOO_TOGI,
    xi.items.RAO_TOGI,
    xi.items.RAO_TOGI_P1,

    xi.items.GROVE_ABJURATION_HANDS,
    xi.items.BEWITCHED_KOTE,
    xi.items.VOODOO_KOTE,
    xi.items.RAO_KOTE,
    xi.items.RAO_KOTE_P1,

    xi.items.GROVE_ABJURATION_LEGS,
    xi.items.BEWITCHED_HAIDATE,
    xi.items.VOODOO_HAIDATE,
    xi.items.RAO_HAIDATE,
    xi.items.RAO_HAIDATE_P1,

    xi.items.GROVE_ABJURATION_FEET,
    xi.items.BEWITCHED_SUNE_ATE,
    xi.items.VOODOO_SUNE_ATE,
    xi.items.RAO_SUNE_ATE,
    xi.items.RAO_SUNE_ATE_P1,

    xi.items.JOVIAN_ABJURATION_HEAD,
    xi.items.VEXED_BONNET,
    xi.items.JINXED_BONNET,
    xi.items.ADHEMAR_BONNET,
    xi.items.ADHEMAR_BONNET_P1,

    xi.items.JOVIAN_ABJURATION_BODY,
    xi.items.VEXED_JACKET,
    xi.items.JINXED_JACKET,
    xi.items.ADHEMAR_JACKET,
    xi.items.ADHEMAR_JACKET_P1,

    xi.items.JOVIAN_ABJURATION_HANDS,
    xi.items.VEXED_WRISTBANDS,
    xi.items.JINXED_WRISTBANDS,
    xi.items.ADHEMAR_WRISTBANDS,
    xi.items.ADHEMAR_WRISTBANDS_P1,

    xi.items.JOVIAN_ABJURATION_LEGS,
    xi.items.VEXED_KECKS,
    xi.items.JINXED_KECKS,
    xi.items.ADHEMAR_KECKS,
    xi.items.ADHEMAR_KECKS_P1,

    xi.items.JOVIAN_ABJURATION_FEET,
    xi.items.VEXED_GAMASHES,
    xi.items.JINXED_GAMASHES,
    xi.items.ADHEMAR_GAMASHES,
    xi.items.ADHEMAR_GAMASHES_P1,

    xi.items.SHINRYU_ABJURATION_HEAD,
    xi.items.BEWITCHED_MASK,
    xi.items.VOODOO_MASK,
    xi.items.CARMINE_MASK,
    xi.items.CARMINE_MASK_P1,

    xi.items.SHINRYU_ABJURATION_BODY,
    xi.items.BEWITCHED_MAIL,
    xi.items.VOODOO_MAIL,
    xi.items.CARMINE_SCALE_MAIL,
    xi.items.CARMINE_SCALE_MAIL_P1,

    xi.items.SHINRYU_ABJURATION_HANDS,
    xi.items.BEWITCHED_FINGER_GAUNTLETS,
    xi.items.VOODOO_FINGER_GAUNTLETS,
    xi.items.CARMINE_FINGER_GAUNTLETS,
    xi.items.CARMINE_FINGER_GAUNTLETS_P1,

    xi.items.SHINRYU_ABJURATION_LEGS,
    xi.items.BEWITCHED_CUISSES,
    xi.items.VOODOO_CUISSES,
    xi.items.CARMINE_CUISSES,
    xi.items.CARMINE_CUISSES_P1,

    xi.items.SHINRYU_ABJURATION_FEET,
    xi.items.BEWITCHED_GREAVES,
    xi.items.VOODOO_GREAVES,
    xi.items.CARMINE_GREAVES,
    xi.items.CARMINE_GREAVES_P1,

    xi.items.TRITON_ABJURATION_HEAD,
    xi.items.BEWITCHED_CAP,
    xi.items.VOODOO_CAP,
    xi.items.LUSTRATIO_CAP,
    xi.items.LUSTRATIO_CAP_P1,

    xi.items.TRITON_ABJURATION_BODY,
    xi.items.BEWITCHED_HARNESS,
    xi.items.VOODOO_HARNESS,
    xi.items.LUSTRATIO_HARNESS,
    xi.items.LUSTRATIO_HARNESS_P1,

    xi.items.TRITON_ABJURATION_HANDS,
    xi.items.BEWITCHED_GLOVES,
    xi.items.VOODOO_GLOVES,
    xi.items.LUSTRATIO_MITTENS,
    xi.items.LUSTRATIO_MITTENS_P1,

    xi.items.TRITON_ABJURATION_LEGS,
    xi.items.BEWITCHED_SUBLIGAR,
    xi.items.VOODOO_SUBLIGAR,
    xi.items.LUSTRATIO_SUBLIGAR,
    xi.items.LUSTRATIO_SUBLIGAR_P1,

    xi.items.TRITON_ABJURATION_FEET,
    xi.items.BEWITCHED_LEGGINGS,
    xi.items.VOODOO_LEGGINGS,
    xi.items.LUSTRATIO_LEGGINGS,
    xi.items.LUSTRATIO_LEGGINGS_P1,

    xi.items.VALE_ABJURATION_HEAD,
    xi.items.BEWITCHED_CELATA,
    xi.items.VOODOO_CELATA,
    xi.items.ARGOSY_CELATA,
    xi.items.ARGOSY_CELATA_P1,

    xi.items.VALE_ABJURATION_BODY,
    xi.items.BEWITCHED_HAUBERK,
    xi.items.VOODOO_HAUBERK,
    xi.items.ARGOSY_HAUBERK,
    xi.items.ARGOSY_HAUBERK_P1,

    xi.items.VALE_ABJURATION_HANDS,
    xi.items.BEWITCHED_MUFFLERS,
    xi.items.VOODOO_MUFFLERS,
    xi.items.ARGOSY_MUFFLERS,
    xi.items.ARGOSY_MUFFLERS_P1,

    xi.items.VALE_ABJURATION_LEGS,
    xi.items.BEWITCHED_BREECHES,
    xi.items.VOODOO_BREECHES,
    xi.items.ARGOSY_BREECHES,
    xi.items.ARGOSY_BREECHES_P1,

    xi.items.VALE_ABJURATION_FEET,
    xi.items.BEWITCHED_SOLLERETS,
    xi.items.VOODOO_SOLLERETS,
    xi.items.ARGOSY_SOLLERETS,
    xi.items.ARGOSY_SOLLERETS_P1,
}
