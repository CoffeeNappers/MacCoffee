.class public final Lcom/google/android/gms/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final AdsAttrs:[I

.field public static final AdsAttrs_adSize:I = 0x0

.field public static final AdsAttrs_adSizes:I = 0x1

.field public static final AdsAttrs_adUnitId:I = 0x2

.field public static final AppDataSearch:[I

.field public static final Corpus:[I

.field public static final Corpus_contentProviderUri:I = 0x2

.field public static final Corpus_corpusId:I = 0x0

.field public static final Corpus_corpusVersion:I = 0x1

.field public static final Corpus_documentMaxAgeSecs:I = 0x6

.field public static final Corpus_perAccountTemplate:I = 0x7

.field public static final Corpus_schemaOrgType:I = 0x4

.field public static final Corpus_semanticallySearchable:I = 0x5

.field public static final Corpus_trimmable:I = 0x3

.field public static final FeatureParam:[I

.field public static final FeatureParam_paramName:I = 0x0

.field public static final FeatureParam_paramValue:I = 0x1

.field public static final GlobalSearch:[I

.field public static final GlobalSearchCorpus:[I

.field public static final GlobalSearchCorpus_allowShortcuts:I = 0x0

.field public static final GlobalSearchSection:[I

.field public static final GlobalSearchSection_sectionContent:I = 0x1

.field public static final GlobalSearchSection_sectionType:I = 0x0

.field public static final GlobalSearch_defaultIntentAction:I = 0x3

.field public static final GlobalSearch_defaultIntentActivity:I = 0x5

.field public static final GlobalSearch_defaultIntentData:I = 0x4

.field public static final GlobalSearch_searchEnabled:I = 0x0

.field public static final GlobalSearch_searchLabel:I = 0x1

.field public static final GlobalSearch_settingsDescription:I = 0x2

.field public static final IMECorpus:[I

.field public static final IMECorpus_inputEnabled:I = 0x0

.field public static final IMECorpus_sourceClass:I = 0x1

.field public static final IMECorpus_toAddressesSection:I = 0x5

.field public static final IMECorpus_userInputSection:I = 0x3

.field public static final IMECorpus_userInputTag:I = 0x2

.field public static final IMECorpus_userInputValue:I = 0x4

.field public static final LoadingImageView:[I

.field public static final LoadingImageView_circleCrop:I = 0x2

.field public static final LoadingImageView_imageAspectRatio:I = 0x1

.field public static final LoadingImageView_imageAspectRatioAdjust:I = 0x0

.field public static final MapAttrs:[I

.field public static final MapAttrs_ambientEnabled:I = 0x10

.field public static final MapAttrs_cameraBearing:I = 0x1

.field public static final MapAttrs_cameraMaxZoomPreference:I = 0x12

.field public static final MapAttrs_cameraMinZoomPreference:I = 0x11

.field public static final MapAttrs_cameraTargetLat:I = 0x2

.field public static final MapAttrs_cameraTargetLng:I = 0x3

.field public static final MapAttrs_cameraTilt:I = 0x4

.field public static final MapAttrs_cameraZoom:I = 0x5

.field public static final MapAttrs_latLngBoundsNorthEastLatitude:I = 0x15

.field public static final MapAttrs_latLngBoundsNorthEastLongitude:I = 0x16

.field public static final MapAttrs_latLngBoundsSouthWestLatitude:I = 0x13

.field public static final MapAttrs_latLngBoundsSouthWestLongitude:I = 0x14

.field public static final MapAttrs_liteMode:I = 0x6

.field public static final MapAttrs_mapType:I = 0x0

.field public static final MapAttrs_uiCompass:I = 0x7

.field public static final MapAttrs_uiMapToolbar:I = 0xf

.field public static final MapAttrs_uiRotateGestures:I = 0x8

.field public static final MapAttrs_uiScrollGestures:I = 0x9

.field public static final MapAttrs_uiTiltGestures:I = 0xa

.field public static final MapAttrs_uiZoomControls:I = 0xb

.field public static final MapAttrs_uiZoomGestures:I = 0xc

.field public static final MapAttrs_useViewLifecycle:I = 0xd

.field public static final MapAttrs_zOrderOnTop:I = 0xe

.field public static final Section:[I

.field public static final SectionFeature:[I

.field public static final SectionFeature_featureType:I = 0x0

.field public static final Section_indexPrefixes:I = 0x4

.field public static final Section_noIndex:I = 0x2

.field public static final Section_schemaOrgProperty:I = 0x6

.field public static final Section_sectionFormat:I = 0x1

.field public static final Section_sectionId:I = 0x0

.field public static final Section_sectionWeight:I = 0x3

.field public static final Section_subsectionSeparator:I = 0x5

.field public static final SignInButton:[I

.field public static final SignInButton_buttonSize:I = 0x0

.field public static final SignInButton_colorScheme:I = 0x1

.field public static final SignInButton_scopeUris:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 195
    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/gms/R$styleable;->AdsAttrs:[I

    .line 199
    new-array v0, v2, [I

    sput-object v0, Lcom/google/android/gms/R$styleable;->AppDataSearch:[I

    .line 200
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/google/android/gms/R$styleable;->Corpus:[I

    .line 209
    new-array v0, v5, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/google/android/gms/R$styleable;->FeatureParam:[I

    .line 212
    new-array v0, v6, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/google/android/gms/R$styleable;->GlobalSearch:[I

    .line 213
    new-array v0, v4, [I

    const v1, 0x7f01017b

    aput v1, v0, v2

    sput-object v0, Lcom/google/android/gms/R$styleable;->GlobalSearchCorpus:[I

    .line 215
    new-array v0, v5, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/google/android/gms/R$styleable;->GlobalSearchSection:[I

    .line 224
    new-array v0, v6, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/google/android/gms/R$styleable;->IMECorpus:[I

    .line 231
    new-array v0, v3, [I

    fill-array-data v0, :array_6

    sput-object v0, Lcom/google/android/gms/R$styleable;->LoadingImageView:[I

    .line 235
    const/16 v0, 0x17

    new-array v0, v0, [I

    fill-array-data v0, :array_7

    sput-object v0, Lcom/google/android/gms/R$styleable;->MapAttrs:[I

    .line 259
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_8

    sput-object v0, Lcom/google/android/gms/R$styleable;->Section:[I

    .line 260
    new-array v0, v4, [I

    const v1, 0x7f010232

    aput v1, v0, v2

    sput-object v0, Lcom/google/android/gms/R$styleable;->SectionFeature:[I

    .line 269
    new-array v0, v3, [I

    fill-array-data v0, :array_9

    sput-object v0, Lcom/google/android/gms/R$styleable;->SignInButton:[I

    return-void

    .line 195
    nop

    :array_0
    .array-data 4
        0x7f010067
        0x7f010068
        0x7f010069
    .end array-data

    .line 200
    :array_1
    .array-data 4
        0x7f01012b
        0x7f01012c
        0x7f01012d
        0x7f01012e
        0x7f01012f
        0x7f010130
        0x7f010131
        0x7f010132
    .end array-data

    .line 209
    :array_2
    .array-data 4
        0x7f01014e
        0x7f01014f
    .end array-data

    .line 212
    :array_3
    .array-data 4
        0x7f010175
        0x7f010176
        0x7f010177
        0x7f010178
        0x7f010179
        0x7f01017a
    .end array-data

    .line 215
    :array_4
    .array-data 4
        0x7f01017c
        0x7f01017d
    .end array-data

    .line 224
    :array_5
    .array-data 4
        0x7f010183
        0x7f010184
        0x7f010185
        0x7f010186
        0x7f010187
        0x7f010188
    .end array-data

    .line 231
    :array_6
    .array-data 4
        0x7f01018e
        0x7f01018f
        0x7f010190
    .end array-data

    .line 235
    :array_7
    .array-data 4
        0x7f010191
        0x7f010192
        0x7f010193
        0x7f010194
        0x7f010195
        0x7f010196
        0x7f010197
        0x7f010198
        0x7f010199
        0x7f01019a
        0x7f01019b
        0x7f01019c
        0x7f01019d
        0x7f01019e
        0x7f01019f
        0x7f0101a0
        0x7f0101a1
        0x7f0101a2
        0x7f0101a3
        0x7f0101a4
        0x7f0101a5
        0x7f0101a6
        0x7f0101a7
    .end array-data

    .line 259
    :array_8
    .array-data 4
        0x7f01022b
        0x7f01022c
        0x7f01022d
        0x7f01022e
        0x7f01022f
        0x7f010230
        0x7f010231
    .end array-data

    .line 269
    :array_9
    .array-data 4
        0x7f010237
        0x7f010238
        0x7f010239
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
