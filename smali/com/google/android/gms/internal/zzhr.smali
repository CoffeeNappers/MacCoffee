.class public Lcom/google/android/gms/internal/zzhr;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzji;
.end annotation


# instance fields
.field private final zzbnz:Lcom/google/android/gms/internal/zzmd;

.field private final zzbyr:Z

.field private final zzbys:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzmd;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzmd;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhr;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    const-string/jumbo v0, "forceOrientation"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzhr;->zzbys:Ljava/lang/String;

    const-string/jumbo v0, "allowOrientationChange"

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "allowOrientationChange"

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhr;->zzbyr:Z

    :goto_0
    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzhr;->zzbyr:Z

    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhr;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    if-nez v0, :cond_0

    const-string/jumbo v0, "AdWebView is null"

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->zzdi(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "portrait"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhr;->zzbys:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgo()Lcom/google/android/gms/internal/zzlc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlc;->zzvx()I

    move-result v0

    :goto_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzhr;->zzbnz:Lcom/google/android/gms/internal/zzmd;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzmd;->setRequestedOrientation(I)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "landscape"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhr;->zzbys:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgo()Lcom/google/android/gms/internal/zzlc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlc;->zzvw()I

    move-result v0

    goto :goto_1

    :cond_2
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzhr;->zzbyr:Z

    if-eqz v0, :cond_3

    const/4 v0, -0x1

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/google/android/gms/ads/internal/zzu;->zzgo()Lcom/google/android/gms/internal/zzlc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzlc;->zzvy()I

    move-result v0

    goto :goto_1
.end method
