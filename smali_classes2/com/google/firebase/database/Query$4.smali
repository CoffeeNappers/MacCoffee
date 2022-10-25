.class Lcom/google/firebase/database/Query$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/database/Query;->keepSynced(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aZB:Z

.field final synthetic aZy:Lcom/google/firebase/database/Query;


# direct methods
.method constructor <init>(Lcom/google/firebase/database/Query;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/firebase/database/Query$4;->aZy:Lcom/google/firebase/database/Query;

    iput-boolean p2, p0, Lcom/google/firebase/database/Query$4;->aZB:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/database/Query$4;->aZy:Lcom/google/firebase/database/Query;

    iget-object v0, v0, Lcom/google/firebase/database/Query;->aZj:Lcom/google/android/gms/internal/zzajs;

    iget-object v1, p0, Lcom/google/firebase/database/Query$4;->aZy:Lcom/google/firebase/database/Query;

    invoke-virtual {v1}, Lcom/google/firebase/database/Query;->zzcrd()Lcom/google/android/gms/internal/zzall;

    move-result-object v1

    iget-boolean v2, p0, Lcom/google/firebase/database/Query$4;->aZB:Z

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzall;Z)V

    return-void
.end method
