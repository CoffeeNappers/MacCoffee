.class Lcom/google/android/gms/internal/zzajs$14;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzalb$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zzb(Lcom/google/android/gms/internal/zzajq;I)Lcom/google/android/gms/internal/zzajq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzalb$zza",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/google/android/gms/internal/zzajs$zza;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic ben:I


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;I)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$14;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput p2, p0, Lcom/google/android/gms/internal/zzajs$14;->ben:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zze(Lcom/google/android/gms/internal/zzalb;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzalb",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/internal/zzajs$zza;",
            ">;>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$14;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget v1, p0, Lcom/google/android/gms/internal/zzajs$14;->ben:I

    invoke-static {v0, p1, v1}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzalb;I)V

    const/4 v0, 0x0

    return v0
.end method
