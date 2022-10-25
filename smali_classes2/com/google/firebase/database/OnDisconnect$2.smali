.class Lcom/google/firebase/database/OnDisconnect$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/OnDisconnect;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aYY:Lcom/google/android/gms/internal/zzank;

.field final synthetic aZs:Lcom/google/firebase/database/OnDisconnect;

.field final synthetic aZt:Ljava/util/Map;

.field final synthetic aZu:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/OnDisconnect;Ljava/util/Map;Lcom/google/android/gms/internal/zzank;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZs:Lcom/google/firebase/database/OnDisconnect;

    iput-object p2, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZt:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/firebase/database/OnDisconnect$2;->aYY:Lcom/google/android/gms/internal/zzank;

    iput-object p4, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZu:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZs:Lcom/google/firebase/database/OnDisconnect;

    invoke-static {v0}, Lcom/google/firebase/database/OnDisconnect;->zzb(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajs;

    move-result-object v1

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZs:Lcom/google/firebase/database/OnDisconnect;

    invoke-static {v0}, Lcom/google/firebase/database/OnDisconnect;->zza(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZt:Ljava/util/Map;

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$2;->aYY:Lcom/google/android/gms/internal/zzank;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzank;->A()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    iget-object v4, p0, Lcom/google/firebase/database/OnDisconnect$2;->aZu:Ljava/util/Map;

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Ljava/util/Map;)V

    return-void
.end method
