.class Lcom/google/android/gms/measurement/internal/zzac$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzac;->setMeasurementEnabled(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic auS:Lcom/google/android/gms/measurement/internal/zzac;

.field final synthetic hT:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzac;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzac$1;->auS:Lcom/google/android/gms/measurement/internal/zzac;

    iput-boolean p2, p0, Lcom/google/android/gms/measurement/internal/zzac$1;->hT:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzac$1;->auS:Lcom/google/android/gms/measurement/internal/zzac;

    iget-boolean v1, p0, Lcom/google/android/gms/measurement/internal/zzac$1;->hT:Z

    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzac;->zza(Lcom/google/android/gms/measurement/internal/zzac;Z)V

    return-void
.end method
