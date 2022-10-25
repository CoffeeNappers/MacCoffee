.class Lcom/google/android/gms/internal/zzajs$18$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzajb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzajs$18;->zza(Lcom/google/android/gms/internal/zzall;Lcom/google/android/gms/internal/zzakb;Lcom/google/android/gms/internal/zzaix;Lcom/google/android/gms/internal/zzaka$zza;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic bes:Lcom/google/android/gms/internal/zzaka$zza;

.field final synthetic bet:Lcom/google/android/gms/internal/zzajs$18;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzajs$18;Lcom/google/android/gms/internal/zzaka$zza;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzajs$18$1;->bet:Lcom/google/android/gms/internal/zzajs$18;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzajs$18$1;->bes:Lcom/google/android/gms/internal/zzaka$zza;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzbn(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {p1, p2}, Lcom/google/android/gms/internal/zzajs;->zzbp(Ljava/lang/String;Ljava/lang/String;)Lcom/google/firebase/database/DatabaseError;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$18$1;->bes:Lcom/google/android/gms/internal/zzaka$zza;

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/zzaka$zza;->zzb(Lcom/google/firebase/database/DatabaseError;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzajs$18$1;->bet:Lcom/google/android/gms/internal/zzajs$18;

    iget-object v1, v1, Lcom/google/android/gms/internal/zzajs$18;->bdZ:Lcom/google/android/gms/internal/zzajs;

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/zzajs;->zza(Lcom/google/android/gms/internal/zzajs;Ljava/util/List;)V

    return-void
.end method
