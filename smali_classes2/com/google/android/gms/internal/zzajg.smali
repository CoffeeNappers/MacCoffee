.class public Lcom/google/android/gms/internal/zzajg;
.super Lcom/google/android/gms/internal/zzajl;


# instance fields
.field private final aZj:Lcom/google/android/gms/internal/zzajs;

.field private final bcX:Lcom/google/firebase/database/ChildEventListener;

.field private final bcY:Lcom/google/android/gms/internal/zzall;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ChildEventListener;Lcom/google/android/gms/internal/zzall;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzajl;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajg;->bcY:Lcom/google/android/gms/internal/zzall;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/android/gms/internal/zzajg;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzajg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/google/android/gms/internal/zzajg;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzajg;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzajg;->bcY:Lcom/google/android/gms/internal/zzall;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->bcY:Lcom/google/android/gms/internal/zzall;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->bcY:Lcom/google/android/gms/internal/zzall;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzall;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "ChildEventRegistration"

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zzajg;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-direct {v0, v1, v2, p1}, Lcom/google/android/gms/internal/zzajg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ChildEventListener;Lcom/google/android/gms/internal/zzall;)V

    return-object v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalg;
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->aZj:Lcom/google/android/gms/internal/zzajs;

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxl()Lcom/google/android/gms/internal/zzalz;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajq;->zza(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)Lcom/google/firebase/database/DatabaseReference;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxj()Lcom/google/android/gms/internal/zzamg;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/firebase/database/zza;->zza(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzamg;)Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxn()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxn()Lcom/google/android/gms/internal/zzalz;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzalz;->asString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    new-instance v2, Lcom/google/android/gms/internal/zzalg;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalf;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v3

    invoke-direct {v2, v3, p0, v1, v0}, Lcom/google/android/gms/internal/zzalg;-><init>(Lcom/google/android/gms/internal/zzalh$zza;Lcom/google/android/gms/internal/zzajl;Lcom/google/firebase/database/DataSnapshot;Ljava/lang/String;)V

    return-object v2

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzalg;)V
    .locals 3

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajg;->zzcvc()Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/zzajg$1;->bcZ:[I

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxm()Lcom/google/android/gms/internal/zzalh$zza;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzalh$zza;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxp()Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxq()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/firebase/database/ChildEventListener;->onChildAdded(Lcom/google/firebase/database/DataSnapshot;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxp()Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxq()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/firebase/database/ChildEventListener;->onChildChanged(Lcom/google/firebase/database/DataSnapshot;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxp()Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxq()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/firebase/database/ChildEventListener;->onChildMoved(Lcom/google/firebase/database/DataSnapshot;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzalg;->zzcxp()Lcom/google/firebase/database/DataSnapshot;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/firebase/database/ChildEventListener;->onChildRemoved(Lcom/google/firebase/database/DataSnapshot;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public zza(Lcom/google/firebase/database/DatabaseError;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    invoke-interface {v0, p1}, Lcom/google/firebase/database/ChildEventListener;->onCancelled(Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzalh$zza;)Z
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzalh$zza;->bhz:Lcom/google/android/gms/internal/zzalh$zza;

    if-eq p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzajl;)Z
    .locals 2

    instance-of v0, p1, Lcom/google/android/gms/internal/zzajg;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzajg;

    iget-object v0, p1, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajg;->bcX:Lcom/google/firebase/database/ChildEventListener;

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

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajg;->bcY:Lcom/google/android/gms/internal/zzall;

    return-object v0
.end method
