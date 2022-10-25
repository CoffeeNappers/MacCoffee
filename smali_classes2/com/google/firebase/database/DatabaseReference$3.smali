.class Lcom/google/firebase/database/DatabaseReference$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/DatabaseReference;->zza(Ljava/util/Map;Lcom/google/firebase/database/DatabaseReference$CompletionListener;)Lcom/google/android/gms/tasks/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aYY:Lcom/google/android/gms/internal/zzank;

.field final synthetic aYZ:Lcom/google/firebase/database/DatabaseReference;

.field final synthetic aZb:Lcom/google/android/gms/internal/zzajh;

.field final synthetic aZc:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/DatabaseReference;Lcom/google/android/gms/internal/zzajh;Lcom/google/android/gms/internal/zzank;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/DatabaseReference$3;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    iput-object p2, p0, Lcom/google/firebase/database/DatabaseReference$3;->aZb:Lcom/google/android/gms/internal/zzajh;

    iput-object p3, p0, Lcom/google/firebase/database/DatabaseReference$3;->aYY:Lcom/google/android/gms/internal/zzank;

    iput-object p4, p0, Lcom/google/firebase/database/DatabaseReference$3;->aZc:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference$3;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    iget-object v1, v0, Lcom/google/firebase/database/DatabaseReference;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference$3;->aYZ:Lcom/google/firebase/database/DatabaseReference;

    invoke-virtual {v0}, Lcom/google/firebase/database/DatabaseReference;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v2

    iget-object v3, p0, Lcom/google/firebase/database/DatabaseReference$3;->aZb:Lcom/google/android/gms/internal/zzajh;

    iget-object v0, p0, Lcom/google/firebase/database/DatabaseReference$3;->aYY:Lcom/google/android/gms/internal/zzank;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzank;->A()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/firebase/database/DatabaseReference$CompletionListener;

    iget-object v4, p0, Lcom/google/firebase/database/DatabaseReference$3;->aZc:Ljava/util/Map;

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzajh;Lcom/google/firebase/database/DatabaseReference$CompletionListener;Ljava/util/Map;)V

    return-void
.end method
