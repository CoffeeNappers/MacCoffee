.class Lcom/google/android/gms/internal/zzajs$8$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs$8;->zzbn(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bef:Lcom/google/firebase/database/DataSnapshot;

.field final synthetic bei:Lcom/google/android/gms/internal/zzajs$zza;

.field final synthetic bej:Lcom/google/android/gms/internal/zzajs$8;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs$8;Lcom/google/android/gms/internal/zzajs$zza;Lcom/google/firebase/database/DataSnapshot;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$8$1;->bej:Lcom/google/android/gms/internal/zzajs$8;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$8$1;->bei:Lcom/google/android/gms/internal/zzajs$zza;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzajs$8$1;->bef:Lcom/google/firebase/database/DataSnapshot;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$8$1;->bei:Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs$zza;->zzi(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/Transaction$Handler;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$8$1;->bef:Lcom/google/firebase/database/DataSnapshot;

    invoke-interface {v0, v1, v2, v3}, Lcom/google/firebase/database/Transaction$Handler;->onComplete(Lcom/google/firebase/database/DatabaseError;ZLcom/google/firebase/database/DataSnapshot;)V

    return-void
.end method
