.class public Lcom/google/android/gms/internal/zztb$zza$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zztb$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "zza"
.end annotation


# instance fields
.field private GS:J

.field private GT:Ljava/util/Map;
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

.field private GU:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/32 v0, 0xa8c0

    iput-wide v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GS:J

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zztb$zza$zza;)J
    .locals 2

    iget-wide v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GS:J

    return-wide v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zztb$zza$zza;)Ljava/util/Map;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GT:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic zzc(Lcom/google/android/gms/internal/zztb$zza$zza;)I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GU:I

    return v0
.end method

.method static synthetic zzd(Lcom/google/android/gms/internal/zztb$zza$zza;)Ljava/util/List;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public zzag(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/internal/zztb$zza$zza;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GT:Ljava/util/Map;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GT:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GT:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public zzaj(J)Lcom/google/android/gms/internal/zztb$zza$zza;
    .locals 1

    iput-wide p1, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GS:J

    return-object p0
.end method

.method public zzazi()Lcom/google/android/gms/internal/zztb$zza;
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zztb$zza;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/internal/zztb$zza;-><init>(Lcom/google/android/gms/internal/zztb$zza$zza;Lcom/google/android/gms/internal/zztb$1;)V

    return-object v0
.end method

.method public zzhj(I)Lcom/google/android/gms/internal/zztb$zza$zza;
    .locals 0

    iput p1, p0, Lcom/google/android/gms/internal/zztb$zza$zza;->GU:I

    return-object p0
.end method
