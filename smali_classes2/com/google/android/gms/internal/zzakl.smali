.class public Lcom/google/android/gms/internal/zzakl;
.super Lcom/google/android/gms/internal/zzakn;


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/google/android/gms/internal/zzakl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/google/android/gms/internal/zzakl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V
    .locals 2

    sget-object v0, Lcom/google/android/gms/internal/zzakn$zza;->bgn:Lcom/google/android/gms/internal/zzakn$zza;

    invoke-direct {p0, v0, p1, p2}, Lcom/google/android/gms/internal/zzakn;-><init>(Lcom/google/android/gms/internal/zzakn$zza;Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    sget-boolean v0, Lcom/google/android/gms/internal/zzakl;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzako;->zzcwr()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string/jumbo v1, "Can\'t have a listen complete from a user source"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :cond_0
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string/jumbo v0, "ListenComplete { path=%s, source=%s }"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakl;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzakl;->zzcwp()Lcom/google/android/gms/internal/zzako;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public zzc(Lcom/google/android/gms/internal/zzalz;)Lcom/google/android/gms/internal/zzakn;
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakl;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzajq;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzakl;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakl;->bgj:Lcom/google/android/gms/internal/zzako;

    invoke-static {}, Lcom/google/android/gms/internal/zzajq;->zzcvg()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakl;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzakl;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakl;->bgj:Lcom/google/android/gms/internal/zzako;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzakl;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzajq;->zzcvk()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzakl;-><init>(Lcom/google/android/gms/internal/zzako;Lcom/google/android/gms/internal/zzajq;)V

    goto :goto_0
.end method
