.class Lcom/google/android/gms/internal/zzakh$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzala;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzakh;->zza(Lcom/google/android/gms/internal/zzajq;Lcom/google/android/gms/internal/zzaml;Ljava/util/List;Z)Lcom/google/android/gms/internal/zzaml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzala",
        "<",
        "Lcom/google/android/gms/internal/zzake;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic bfX:Z

.field final synthetic bfY:Ljava/util/List;

.field final synthetic bfZ:Lcom/google/android/gms/internal/zzajq;

.field final synthetic bga:Lcom/google/android/gms/internal/zzakh;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzakh;ZLjava/util/List;Lcom/google/android/gms/internal/zzajq;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzakh$1;->bga:Lcom/google/android/gms/internal/zzakh;

    iput-boolean p2, p0, Lcom/google/android/gms/internal/zzakh$1;->bfX:Z

    iput-object p3, p0, Lcom/google/android/gms/internal/zzakh$1;->bfY:Ljava/util/List;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzakh$1;->bfZ:Lcom/google/android/gms/internal/zzajq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzake;)Z
    .locals 4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzake;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzakh$1;->bfX:Z

    if-eqz v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzakh$1;->bfY:Ljava/util/List;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzakh$1;->bfZ:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajq;->zzi(Lcom/google/android/gms/internal/zzajq;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzakh$1;->bfZ:Lcom/google/android/gms/internal/zzajq;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajq;->zzi(Lcom/google/android/gms/internal/zzajq;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public synthetic zzbs(Ljava/lang/Object;)Z
    .locals 1

    check-cast p1, Lcom/google/android/gms/internal/zzake;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzakh$1;->zza(Lcom/google/android/gms/internal/zzake;)Z

    move-result v0

    return v0
.end method
