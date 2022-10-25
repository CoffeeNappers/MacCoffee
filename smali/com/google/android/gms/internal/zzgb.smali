.class Lcom/google/android/gms/internal/zzgb;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzgb$zza;
    }
.end annotation


# instance fields
.field private final zzant:Ljava/lang/String;

.field private final zzbso:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/gms/internal/zzgb$zza;",
            ">;"
        }
    .end annotation
.end field

.field private zzbsp:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

.field private final zzbsq:I

.field private zzbsr:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzaa;->zzy(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgb;->zzbsp:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgb;->zzant:Ljava/lang/String;

    iput p3, p0, Lcom/google/android/gms/internal/zzgb;->zzbsq:I

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzgb;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzant:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/zzgb;)Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbsp:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    return-object v0
.end method


# virtual methods
.method getAdUnitId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzant:Ljava/lang/String;

    return-object v0
.end method

.method getNetworkType()I
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbsq:I

    return v0
.end method

.method size()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method zza(Lcom/google/android/gms/internal/zzfw;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzgb$zza;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/zzgb$zza;-><init>(Lcom/google/android/gms/internal/zzgb;Lcom/google/android/gms/internal/zzfw;Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method zzb(Lcom/google/android/gms/internal/zzfw;)V
    .locals 2

    new-instance v0, Lcom/google/android/gms/internal/zzgb$zza;

    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/zzgb$zza;-><init>(Lcom/google/android/gms/internal/zzgb;Lcom/google/android/gms/internal/zzfw;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgb$zza;->zznt()V

    return-void
.end method

.method zzno()Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbsp:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    return-object v0
.end method

.method zznp()I
    .locals 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v1, v0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgb$zza;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/zzgb$zza;->zzbsw:Z

    if-eqz v0, :cond_1

    add-int/lit8 v0, v1, 0x1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method zznq()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgb$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgb$zza;->zznt()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method zznr()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbsr:Z

    return-void
.end method

.method zzns()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbsr:Z

    return v0
.end method

.method zzp(Lcom/google/android/gms/ads/internal/client/AdRequestParcel;)Lcom/google/android/gms/internal/zzgb$zza;
    .locals 1
    .param p1    # Lcom/google/android/gms/ads/internal/client/AdRequestParcel;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgb;->zzbsp:Lcom/google/android/gms/ads/internal/client/AdRequestParcel;

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzgb;->zzbso:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgb$zza;

    return-object v0
.end method
