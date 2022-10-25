.class Lcom/google/android/gms/internal/zzajs$18;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzaka$zzd;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zzcvo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$18;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;)V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$18;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzc(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaiy;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzalk;->zzcyd()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/util/Map;)V

    return-void
.end method

.method public zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaka$zza;)V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$18;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzajs;->zzc(Lcom/google/android/gms/internal/zzajs;)Lcom/google/android/gms/internal/zzaiy;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzajq;->zzcvi()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzall;->zzcyh()Lcom/google/android/gms/internal/zzalk;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzalk;->zzcyd()Ljava/util/Map;

    move-result-object v2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/google/android/gms/internal/zzakb;->zzcwc()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_0
    new-instance v5, Lcom/google/android/gms/internal/zzajs$18$1;

    invoke-direct {v5, p0, p4}, Lcom/google/android/gms/internal/zzajs$18$1;-><init>(Lcom/google/android/gms/internal/zzajs$18;Lcom/google/android/gms/internal/zzaka$zza;)V

    move-object v3, p3

    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/zzaiy;->zza(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaix;Ljava/lang/Long;Lcom/google/android/gms/internal/zzajb;)V

    return-void

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method
