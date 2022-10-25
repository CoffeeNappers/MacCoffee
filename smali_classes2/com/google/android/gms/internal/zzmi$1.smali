.class Lcom/google/android/gms/internal/zzmi$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzmi;->zze(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic F:Ljava/util/Map;

.field final synthetic G:Lcom/google/android/gms/internal/zzmi;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzmi;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzmi$1;->G:Lcom/google/android/gms/internal/zzmi;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzmi$1;->F:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzmi$1;->G:Lcom/google/android/gms/internal/zzmi;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzmi;->zzb(Lcom/google/android/gms/internal/zzmi;)Lcom/google/android/gms/internal/zzmd;

    move-result-object v0

    const-string/jumbo v1, "pubVideoCmd"

    iget-object v2, p0, Lcom/google/android/gms/internal/zzmi$1;->F:Ljava/util/Map;

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzmd;->zza(Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
