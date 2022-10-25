.class Lcom/google/android/gms/measurement/internal/zzaf$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzaf;->onStartCommand(Landroid/content/Intent;II)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic aB:I

.field final synthetic atw:Lcom/google/android/gms/measurement/internal/zzx;

.field final synthetic atz:Lcom/google/android/gms/measurement/internal/zzq;

.field final synthetic avK:Lcom/google/android/gms/measurement/internal/zzaf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzaf;Lcom/google/android/gms/measurement/internal/zzx;ILcom/google/android/gms/measurement/internal/zzq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->avK:Lcom/google/android/gms/measurement/internal/zzaf;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atw:Lcom/google/android/gms/measurement/internal/zzx;

    iput p3, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->aB:I

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atz:Lcom/google/android/gms/measurement/internal/zzq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyj()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->atw:Lcom/google/android/gms/measurement/internal/zzx;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbye()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzaf$1;->avK:Lcom/google/android/gms/measurement/internal/zzaf;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzb(Lcom/google/android/gms/measurement/internal/zzaf;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzaf$1$1;

    invoke-direct {v1, p0}, Lcom/google/android/gms/measurement/internal/zzaf$1$1;-><init>(Lcom/google/android/gms/measurement/internal/zzaf$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
