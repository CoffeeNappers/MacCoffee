.class Lcom/google/firebase/database/OnDisconnect$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/OnDisconnect;->zzb(Ljava/lang/Object;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aYX:Lcom/google/android/gms/internal/zzaml;

.field final synthetic aYY:Lcom/google/android/gms/internal/zzank;

.field final synthetic aZs:Lcom/google/firebase/database/OnDisconnect;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/OnDisconnect;Lcom/google/android/gms/internal/zzaml;Lcom/google/android/gms/internal/zzank;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/OnDisconnect$1;->aZs:Lcom/google/firebase/database/OnDisconnect;

    iput-object p2, p0, Lcom/google/firebase/database/OnDisconnect$1;->aYX:Lcom/google/android/gms/internal/zzaml;

    iput-object p3, p0, Lcom/google/firebase/database/OnDisconnect$1;->aYY:Lcom/google/android/gms/internal/zzank;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$1;->aZs:Lcom/google/firebase/database/OnDisconnect;

    invoke-static {v0}, Lcom/google/firebase/database/OnDisconnect;->zzb(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajs;

    move-result-object v1

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$1;->aZs:Lcom/google/firebase/database/OnDisconnect;

    invoke-static {v0}, Lcom/google/firebase/database/OnDisconnect;->zza(Lcom/google/firebase/database/OnDisconnect;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/database/OnDisconnect$1;->aYX:Lcom/google/android/gms/internal/zzaml;

    iget-object v0, p0, Lcom/google/firebase/database/OnDisconnect$1;->aYY:Lcom/google/android/gms/internal/zzank;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzank;->A()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    invoke-virtual {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)V

    return-void
.end method
