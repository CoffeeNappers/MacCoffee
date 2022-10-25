.class public Lcom/google/android/gms/ads/internal/formats/zza;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# static fields
.field private static final zzbmk:I

.field private static final zzbml:I

.field static final zzbmm:I

.field static final zzbmn:I


# instance fields
.field private final mBackgroundColor:I

.field private final mTextColor:I

.field private final zzbmo:Ljava/lang/String;

.field private final zzbmp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field

.field private final zzbmq:I

.field private final zzbmr:I

.field private final zzbms:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v3, 0xcc

    const/16 v0, 0xc

    const/16 v1, 0xae

    const/16 v2, 0xce

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmk:I

    invoke-static {v3, v3, v3}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbml:I

    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbml:I

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmm:I

    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmk:I

    sput v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmn:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/drawable/Drawable;",
            ">;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "II)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmo:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmp:Ljava/util/List;

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mBackgroundColor:I

    if-eqz p4, :cond_1

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_1
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mTextColor:I

    if-eqz p5, :cond_2

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_2
    iput v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmq:I

    iput p6, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmr:I

    iput p7, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbms:I

    return-void

    :cond_0
    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmm:I

    goto :goto_0

    :cond_1
    sget v0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmn:I

    goto :goto_1

    :cond_2
    const/16 v0, 0xc

    goto :goto_2
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mBackgroundColor:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmo:Ljava/lang/String;

    return-object v0
.end method

.method public getTextColor()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->mTextColor:I

    return v0
.end method

.method public getTextSize()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmq:I

    return v0
.end method

.method public zzmj()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmp:Ljava/util/List;

    return-object v0
.end method

.method public zzmk()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbmr:I

    return v0
.end method

.method public zzml()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/ads/internal/formats/zza;->zzbms:I

    return v0
.end method
