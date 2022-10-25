.class Lcom/google/firebase/database/Query$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/Query;->zza(Lcom/google/android/gms/internal/zzajl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZy:Lcom/google/firebase/database/Query;

.field final synthetic aZz:Lcom/google/android/gms/internal/zzajl;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/Query;Lcom/google/android/gms/internal/zzajl;)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/Query$2;->aZy:Lcom/google/firebase/database/Query;

    iput-object p2, p0, Lcom/google/firebase/database/Query$2;->aZz:Lcom/google/android/gms/internal/zzajl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/firebase/database/Query$2;->aZy:Lcom/google/firebase/database/Query;

    iget-object v0, v0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/firebase/database/Query$2;->aZz:Lcom/google/android/gms/internal/zzajl;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zze(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method
