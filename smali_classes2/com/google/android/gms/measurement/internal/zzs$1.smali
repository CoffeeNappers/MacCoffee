.class Lcom/google/android/gms/measurement/internal/zzs$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzs;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic asV:Z

.field final synthetic asW:Lcom/google/android/gms/measurement/internal/zzs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzs;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzs$1;->asW:Lcom/google/android/gms/measurement/internal/zzs;

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzs$1;->asV:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzs$1;->asW:Lcom/google/android/gms/measurement/internal/zzs;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzs;->zza(Lcom/google/android/gms/measurement/internal/zzs;)Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    iget-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzs$1;->asV:Z

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzx;->zzaw(Z)V

    return-void
.end method
