.class public Lcom/google/android/gms/internal/zztb$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zztb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zztb$zza$zza;
    }
.end annotation


# instance fields
.field private final GS:J

.field private final GT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final GU:I

.field private final GV:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/config/internal/AnalyticsUserProperty;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zztb$zza$zza;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/internal/zztb$zza$zza;->zza(Lcom/google/android/gms/internal/zztb$zza$zza;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GS:J

    invoke-static {p1}, Lcom/google/android/gms/internal/zztb$zza$zza;->zzb(Lcom/google/android/gms/internal/zztb$zza$zza;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GT:Ljava/util/Map;

    invoke-static {p1}, Lcom/google/android/gms/internal/zztb$zza$zza;->zzc(Lcom/google/android/gms/internal/zztb$zza$zza;)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GU:I

    invoke-static {p1}, Lcom/google/android/gms/internal/zztb$zza$zza;->zzd(Lcom/google/android/gms/internal/zztb$zza$zza;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GV:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zztb$zza$zza;Lcom/google/android/gms/internal/zztb$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zztb$zza;-><init>(Lcom/google/android/gms/internal/zztb$zza$zza;)V

    return-void
.end method


# virtual methods
.method public zzazf()J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GS:J

    return-wide v0
.end method

.method public zzazg()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GT:Ljava/util/Map;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GT:Ljava/util/Map;

    goto :goto_0
.end method

.method public zzazh()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zztb$zza;->GU:I

    return v0
.end method
