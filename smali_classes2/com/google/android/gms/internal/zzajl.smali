.class public abstract Lcom/google/android/gms/internal/zzajl;
.super Ljava/lang/Object;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private bdu:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private bdv:Lcom/google/android/gms/internal/zzajm;

.field private bdw:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzajl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdu:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-boolean v1, p0, Lcom/google/android/gms/internal/zzajl;->bdw:Z

    return-void
.end method


# virtual methods
.method public abstract zza(Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzajl;
.end method

.method public abstract zza(Lcom/google/android/gms/internal/zzalf;Lcom/google/android/gms/internal/zzall;)Lcom/google/android/gms/internal/zzalg;
.end method

.method public zza(Lcom/google/android/gms/internal/zzajm;)V
    .locals 1

    sget-boolean v0, Lcom/google/android/gms/internal/zzajl;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzajl;->zzcvc()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_0
    sget-boolean v0, Lcom/google/android/gms/internal/zzajl;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdv:Lcom/google/android/gms/internal/zzajm;

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_1
    iput-object p1, p0, Lcom/google/android/gms/internal/zzajl;->bdv:Lcom/google/android/gms/internal/zzajm;

    return-void
.end method

.method public abstract zza(Lcom/google/android/gms/internal/zzalg;)V
.end method

.method public abstract zza(Lcom/google/firebase/database/DatabaseError;)V
.end method

.method public abstract zza(Lcom/google/android/gms/internal/zzalh$zza;)Z
.end method

.method public abstract zzc(Lcom/google/android/gms/internal/zzajl;)Z
.end method

.method public abstract zzcud()Lcom/google/android/gms/internal/zzall;
.end method

.method public zzcvb()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdu:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdv:Lcom/google/android/gms/internal/zzajm;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdv:Lcom/google/android/gms/internal/zzajm;

    invoke-interface {v0, p0}, Lcom/google/android/gms/internal/zzajm;->zzd(Lcom/google/android/gms/internal/zzajl;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdv:Lcom/google/android/gms/internal/zzajm;

    :cond_0
    return-void
.end method

.method public zzcvc()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajl;->bdu:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public zzcvd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzajl;->bdw:Z

    return v0
.end method

.method public zzdb(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/zzajl;->bdw:Z

    return-void
.end method
