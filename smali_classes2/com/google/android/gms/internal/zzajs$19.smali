.class Lcom/google/android/gms/internal/zzajs$19;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzaku;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic beu:Lcom/google/android/gms/internal/zzake;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzake;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$19;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$19;->beu:Lcom/google/android/gms/internal/zzake;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzbp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$19;->bdZ:Lcom/google/android/gms/internal/zzajs;

    const-string/jumbo v2, "Persisted write"

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$19;->beu:Lcom/google/android/gms/internal/zzake;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/lang/String;Lcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$19;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$19;->beu:Lcom/google/android/gms/internal/zzake;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzake;->zzcwd()J

    move-result-wide v2

    iget-object v4, p0, Lcom/google/android/gms/internal/zzajs$19;->beu:Lcom/google/android/gms/internal/zzake;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/zzake;->zzcrc()Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-static {v1, v2, v3, v4, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;JLcom/google/android/gms/internal/zzajq;Lcom/google/firebase/database/DatabaseError;)V

    return-void
.end method
