.class Lcom/google/android/gms/internal/zzajs$10;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs;->zzb(Ljava/util/List;Lcom/google/android/gms/internal/zzajq;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bdZ:Lcom/google/android/gms/internal/zzajs;

.field final synthetic bek:Lcom/google/android/gms/internal/zzajs$zza;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/android/gms/internal/zzajs$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$10;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$10;->bek:Lcom/google/android/gms/internal/zzajs$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzajs$10;->bdZ:Lcom/google/android/gms/internal/zzajs;

    new-instance v1, Lcom/google/android/gms/internal/zzakg;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzajs$10;->bdZ:Lcom/google/android/gms/internal/zzajs;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzajs$10;->bek:Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v3}, Lcom/google/android/gms/internal/zzajs$zza;->zzj(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/firebase/database/ValueEventListener;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzajs$10;->bek:Lcom/google/android/gms/internal/zzajs$zza;

    invoke-static {v4}, Lcom/google/android/gms/internal/zzajs$zza;->zzf(Lcom/google/android/gms/internal/zzajs$zza;)Lcom/google/android/gms/internal/zzajq;

    move-result-object v4

    invoke-static {v4}, Lcom/google/android/gms/internal/zzall;->zzan(Lcom/google/android/gms/internal/zzajq;)Lcom/google/android/gms/internal/zzall;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzakg;-><init>(Lcom/google/android/gms/internal/zzajs;Lcom/google/firebase/database/ValueEventListener;Lcom/google/android/gms/internal/zzall;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzajs;->zze(Lcom/google/android/gms/internal/zzajl;)V

    return-void
.end method
