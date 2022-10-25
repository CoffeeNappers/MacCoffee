.class public Lcom/google/firebase/database/OnDisconnect;
.super Ljava/lang/Object;


# instance fields
.field private aZj:Lcom/google/android/gms/internal/zzajs;

.field private aZr:Lcom/google/android/gms/internal/zzajq;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/database/OnDisconnect;->aZj:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/firebase/database/OnDisconnect;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-void
.end method

.method static synthetic zza(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajq;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect;->aZr:Lcom/google/android/gms/internal/zzajq;

    return-object v0
.end method

.method private zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v0

    iget-object v1, p0, Lcom/google/firebase/database/OnDisconnect;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v2, Lcom/google/firebase/database/OnDisconnect$3;

    invoke-direct {v2, p0, v0}, Lcom/google/firebase/database/OnDisconnect$3;-><init>(Lcom/google/firebase/database/OnDisconnect;Lcom/google/android/gms/internal/zzank;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method

.method private zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzano;->zzc(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-static {p2}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/database/OnDisconnect;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v3, Lcom/google/firebase/database/OnDisconnect$2;

    invoke-direct {v3, p0, v0, v1, p1}, Lcom/google/firebase/database/OnDisconnect$2;-><init>(Lcom/google/firebase/database/OnDisconnect;Ljava/util/Map;Lcom/google/android/gms/internal/zzank;Ljava/util/Map;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajs;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect;->aZj:Lcom/google/android/gms/internal/zzajs;

    return-object v0
.end method

.method private zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/google/android/gms/internal/zzaml;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzaq(Lcom/google/android/gms/internal/zzajq;)V

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect;->aZr:Lcom/google/android/gms/internal/zzajq;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/zzakf;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/google/android/gms/internal/zzanp;->zzby(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzano;->zzbx(Ljava/lang/Object;)V

    invoke-static {v0, p2}, Lcom/google/android/gms/internal/zzamm;->zza(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-static {p3}, Lcom/google/android/gms/internal/zzann;->zzb(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/internal/zzank;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/database/OnDisconnect;->aZj:Lcom/google/android/gms/internal/zzajs;

    new-instance v3, Lcom/google/firebase/database/OnDisconnect$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/google/firebase/database/OnDisconnect$1;-><init>(Lcom/google/firebase/database/OnDisconnect;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzank;)V

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzajs;->zzs(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzank;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/tasks/Task;

    return-object v0
.end method


# virtual methods
.method public cancel()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/firebase/database/OnDisconnect;->zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public cancel(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/firebase/database/OnDisconnect;->zza(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public removeValue()Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/firebase/database/OnDisconnect;->setValue(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public removeValue(Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/google/firebase/database/OnDisconnect;->setValue(Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    return-void
.end method

.method public setValue(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;D)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "D)",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;DLcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 2

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p4}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setValue(Ljava/lang/Object;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    invoke-static {}, Lcom/google/android/gms/internal/zzamp;->c()Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setValue(Ljava/lang/Object;Ljava/lang/String;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public setValue(Ljava/lang/Object;Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 1

    invoke-static {p2}, Lcom/google/android/gms/internal/zzamp;->zzbu(Ljava/lang/Object;)Lcom/google/android/gms/internal/zzaml;

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public updateChildren(Ljava/util/Map;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/google/android/gms/tasks/Task",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/firebase/database/OnDisconnect;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public updateChildren(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/google/firebase/database/DatabaseReference$CompletionListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/database/OnDisconnect;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method
