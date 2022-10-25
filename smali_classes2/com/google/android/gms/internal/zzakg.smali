.class public Lcom/google/android/gms/internal/zzakg;
.super Lcom/google/android/gms/internal/zzajl;


# instance fields
.field private final aZj:Lcom/google/android/gms/internal/zzajs;

.field private final bcY:Lcom/google/android/gms/internal/zzall;

.field private final bfS:Lcom/google/firebase/database/ValueEventListener;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajl;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakg;->bcY:Lcom/google/android/gms/internal/zzall;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/android/gms/internal/zzakg;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzakg;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzakg;->bcY:Lcom/google/android/gms/internal/zzall;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->bcY:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzall;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->bcY:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "ValueEventRegistration"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzakg;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalg;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzamg;)Lcom/google/firebase/database/DataSnapshot;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzalg;

    sget-object v2, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, v0, v3}, Lcom/google/android/gms/internal/zzalg;-><init>(Lcom/google/android/gms/internal/zzalh$zza;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DataSnapshot;Ljava/lang/String;)V

    return-object v1
.end method

.method public zza(Lcom/google/android/gms/internal/zzalg;)V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakg;->zzcvc()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxp()Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/firebase/database/ValueEventListener;->onDataChange(Lcom/google/firebase/database/DataSnapshot;)V

    goto :goto_0
.end method

.method public zza(Lcom/google/firebase/database/DatabaseError;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/ValueEventListener;->onCancelled(Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzalh$zza;)Z
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajl;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/android/gms/internal/zzakg;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzakg;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakg;->bfS:Lcom/google/firebase/database/ValueEventListener;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzcud()Lcom/google/android/gms/internal/zzall;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakg;->bcY:Lcom/google/android/gms/internal/zzall;

    return-object v0
.end method
