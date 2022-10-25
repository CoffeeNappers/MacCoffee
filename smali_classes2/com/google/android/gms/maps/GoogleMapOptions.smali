.class public final Lcom/google/android/gms/maps/GoogleMapOptions;
.super Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;

# interfaces
.implements Lcom/google/android/gms/common/internal/ReflectedParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/maps/GoogleMapOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private aoA:Ljava/lang/Boolean;

.field private aoB:Ljava/lang/Boolean;

.field private aoC:Ljava/lang/Boolean;

.field private aoD:Ljava/lang/Boolean;

.field private aoE:Ljava/lang/Boolean;

.field private aoF:Ljava/lang/Boolean;

.field private aoG:Ljava/lang/Float;

.field private aoH:Ljava/lang/Float;

.field private aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

.field private aot:Ljava/lang/Boolean;

.field private aou:Ljava/lang/Boolean;

.field private aov:I

.field private aow:Lcom/google/android/gms/maps/model/CameraPosition;

.field private aox:Ljava/lang/Boolean;

.field private aoy:Ljava/lang/Boolean;

.field private aoz:Ljava/lang/Boolean;

.field private final mVersionCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/maps/zza;

    invoke-direct {v0}, Lcom/google/android/gms/maps/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/maps/GoogleMapOptions;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aov:I

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoG:Ljava/lang/Float;

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoH:Ljava/lang/Float;

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->mVersionCode:I

    return-void
.end method

.method constructor <init>(IBBILcom/google/android/gms/maps/model/CameraPosition;BBBBBBBBBLjava/lang/Float;Ljava/lang/Float;Lcom/google/android/gms/maps/model/LatLngBounds;)V
    .locals 2

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;-><init>()V

    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aov:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoG:Ljava/lang/Float;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoH:Ljava/lang/Float;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

    iput p1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->mVersionCode:I

    invoke-static {p2}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aot:Ljava/lang/Boolean;

    invoke-static {p3}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aou:Ljava/lang/Boolean;

    iput p4, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aov:I

    iput-object p5, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aow:Lcom/google/android/gms/maps/model/CameraPosition;

    invoke-static {p6}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aox:Ljava/lang/Boolean;

    invoke-static {p7}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoy:Ljava/lang/Boolean;

    invoke-static {p8}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoz:Ljava/lang/Boolean;

    invoke-static {p9}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoA:Ljava/lang/Boolean;

    invoke-static {p10}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoB:Ljava/lang/Boolean;

    invoke-static {p11}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoC:Ljava/lang/Boolean;

    invoke-static {p12}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoD:Ljava/lang/Boolean;

    invoke-static {p13}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoE:Ljava/lang/Boolean;

    invoke-static/range {p14 .. p14}, Lcom/google/android/gms/maps/internal/zza;->zza(B)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoF:Ljava/lang/Boolean;

    move-object/from16 v0, p15

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoG:Ljava/lang/Float;

    move-object/from16 v0, p16

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoH:Ljava/lang/Float;

    move-object/from16 v0, p17

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-void
.end method

.method public static createFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 6

    const/4 v5, 0x0

    const/4 v4, 0x1

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/R$styleable;->MapAttrs:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-direct {v0}, Lcom/google/android/gms/maps/GoogleMapOptions;-><init>()V

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_mapType:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_1

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_mapType:I

    const/4 v3, -0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->mapType(I)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_1
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_zOrderOnTop:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_2

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_zOrderOnTop:I

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->zOrderOnTop(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_2
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_useViewLifecycle:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_3

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_useViewLifecycle:I

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->useViewLifecycleInFragment(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_3
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiCompass:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_4

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiCompass:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_4
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiRotateGestures:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_5

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiRotateGestures:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->rotateGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_5
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiScrollGestures:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_6

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiScrollGestures:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_6
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiTiltGestures:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_7

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiTiltGestures:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->tiltGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_7
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiZoomGestures:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_8

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiZoomGestures:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_8
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiZoomControls:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_9

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiZoomControls:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_9
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_liteMode:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_a

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_liteMode:I

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->liteMode(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_a
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiMapToolbar:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_b

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_uiMapToolbar:I

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->mapToolbarEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_b
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_ambientEnabled:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_c

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_ambientEnabled:I

    invoke-virtual {v1, v2, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->ambientEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_c
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_cameraMinZoomPreference:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_d

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_cameraMinZoomPreference:I

    const/high16 v3, -0x800000    # Float.NEGATIVE_INFINITY

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->minZoomPreference(F)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_d
    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_cameraMinZoomPreference:I

    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_e

    sget v2, Lcom/google/android/gms/R$styleable;->MapAttrs_cameraMaxZoomPreference:I

    const/high16 v3, 0x7f800000    # Float.POSITIVE_INFINITY

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->maxZoomPreference(F)Lcom/google/android/gms/maps/GoogleMapOptions;

    :cond_e
    invoke-static {p0, p1}, Lcom/google/android/gms/maps/model/LatLngBounds;->createFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/google/android/gms/maps/model/LatLngBounds;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->latLngBoundsForCameraTarget(Lcom/google/android/gms/maps/model/LatLngBounds;)Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-static {p0, p1}, Lcom/google/android/gms/maps/model/CameraPosition;->createFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)Lcom/google/android/gms/maps/model/CameraPosition;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/maps/GoogleMapOptions;->camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    goto/16 :goto_0
.end method


# virtual methods
.method public ambientEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoF:Ljava/lang/Boolean;

    return-object p0
.end method

.method public camera(Lcom/google/android/gms/maps/model/CameraPosition;)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aow:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object p0
.end method

.method public compassEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoy:Ljava/lang/Boolean;

    return-object p0
.end method

.method public getAmbientEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoF:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getCamera()Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aow:Lcom/google/android/gms/maps/model/CameraPosition;

    return-object v0
.end method

.method public getCompassEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoy:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getLatLngBoundsForCameraTarget()Lcom/google/android/gms/maps/model/LatLngBounds;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object v0
.end method

.method public getLiteMode()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoD:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getMapToolbarEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoE:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getMapType()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aov:I

    return v0
.end method

.method public getMaxZoomPreference()Ljava/lang/Float;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoH:Ljava/lang/Float;

    return-object v0
.end method

.method public getMinZoomPreference()Ljava/lang/Float;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoG:Ljava/lang/Float;

    return-object v0
.end method

.method public getRotateGesturesEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoC:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getScrollGesturesEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoz:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTiltGesturesEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoB:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getUseViewLifecycleInFragment()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aou:Ljava/lang/Boolean;

    return-object v0
.end method

.method getVersionCode()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->mVersionCode:I

    return v0
.end method

.method public getZOrderOnTop()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aot:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getZoomControlsEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aox:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getZoomGesturesEnabled()Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoA:Ljava/lang/Boolean;

    return-object v0
.end method

.method public latLngBoundsForCameraTarget(Lcom/google/android/gms/maps/model/LatLngBounds;)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoI:Lcom/google/android/gms/maps/model/LatLngBounds;

    return-object p0
.end method

.method public liteMode(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoD:Ljava/lang/Boolean;

    return-object p0
.end method

.method public mapToolbarEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public mapType(I)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aov:I

    return-object p0
.end method

.method public maxZoomPreference(F)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoH:Ljava/lang/Float;

    return-object p0
.end method

.method public minZoomPreference(F)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoG:Ljava/lang/Float;

    return-object p0
.end method

.method public rotateGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoC:Ljava/lang/Boolean;

    return-object p0
.end method

.method public scrollGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoz:Ljava/lang/Boolean;

    return-object p0
.end method

.method public tiltGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoB:Ljava/lang/Boolean;

    return-object p0
.end method

.method public useViewLifecycleInFragment(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aou:Ljava/lang/Boolean;

    return-object p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/google/android/gms/maps/zza;->zza(Lcom/google/android/gms/maps/GoogleMapOptions;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zOrderOnTop(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aot:Ljava/lang/Boolean;

    return-object p0
.end method

.method public zoomControlsEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aox:Ljava/lang/Boolean;

    return-object p0
.end method

.method public zoomGesturesEnabled(Z)Lcom/google/android/gms/maps/GoogleMapOptions;
    .locals 1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoA:Ljava/lang/Boolean;

    return-object p0
.end method

.method zzbse()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aot:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsf()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aou:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsg()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aox:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsh()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoy:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsi()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoz:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsj()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoA:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsk()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoB:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsl()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoC:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsm()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoD:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbsn()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoE:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method

.method zzbso()B
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/maps/GoogleMapOptions;->aoF:Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/google/android/gms/maps/internal/zza;->zze(Ljava/lang/Boolean;)B

    move-result v0

    return v0
.end method
