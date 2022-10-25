.class public Lcom/google/android/gms/internal/zzcr;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzct;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzaua:Lcom/google/android/gms/internal/zzcp;

.field private final zzaub:Lcom/google/android/gms/internal/zzgi;

.field private final zzauc:Lcom/google/android/gms/internal/zzfe;

.field private final zzaud:Lcom/google/android/gms/internal/zzfe;

.field private final zzaue:Lcom/google/android/gms/internal/zzfe;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzcp;Lcom/google/android/gms/internal/zzgi;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/internal/zzcr$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzcr$1;-><init>(Lcom/google/android/gms/internal/zzcr;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzauc:Lcom/google/android/gms/internal/zzfe;

    new-instance v0, Lcom/google/android/gms/internal/zzcr$2;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzcr$2;-><init>(Lcom/google/android/gms/internal/zzcr;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaud:Lcom/google/android/gms/internal/zzfe;

    new-instance v0, Lcom/google/android/gms/internal/zzcr$3;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzcr$3;-><init>(Lcom/google/android/gms/internal/zzcr;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaue:Lcom/google/android/gms/internal/zzfe;

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcr;->zzaua:Lcom/google/android/gms/internal/zzcp;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzcr;->zzaub:Lcom/google/android/gms/internal/zzgi;

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaub:Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzcr;->zzc(Lcom/google/android/gms/internal/zzgi;)V

    const-string/jumbo v1, "Custom JS tracking ad unit: "

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaua:Lcom/google/android/gms/internal/zzcp;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcp;->zziq()Lcom/google/android/gms/internal/zzcn;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzcn;->zzib()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdg(Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic zza(Lcom/google/android/gms/internal/zzcr;)Lcom/google/android/gms/internal/zzcp;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaua:Lcom/google/android/gms/internal/zzcp;

    return-object v0
.end method


# virtual methods
.method zzc(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    const-string/jumbo v0, "/updateActiveView"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzauc:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/untrackActiveViewUnit"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzaud:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/visibilityChanged"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzaue:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    return-void
.end method

.method public zzc(Lorg/json/JSONObject;Z)V
    .locals 2

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaub:Lcom/google/android/gms/internal/zzgi;

    const-string/jumbo v1, "AFMA_updateActiveView"

    invoke-interface {v0, v1, p1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaua:Lcom/google/android/gms/internal/zzcp;

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zzcp;->zzb(Lcom/google/android/gms/internal/zzct;)V

    goto :goto_0
.end method

.method zzd(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    const-string/jumbo v0, "/visibilityChanged"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzaue:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/untrackActiveViewUnit"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzaud:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    const-string/jumbo v0, "/updateActiveView"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcr;->zzauc:Lcom/google/android/gms/internal/zzfe;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zzb(Ljava/lang/String;Lcom/google/android/gms/internal/zzfe;)V

    return-void
.end method

.method public zziu()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public zziv()V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcr;->zzaub:Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzcr;->zzd(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method
