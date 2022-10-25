.class Lcom/google/android/gms/measurement/internal/zzy$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic alm:Ljava/lang/String;

.field final synthetic auH:Lcom/google/android/gms/measurement/internal/zzy;

.field final synthetic auI:Lcom/google/android/gms/measurement/internal/EventParcel;

.field final synthetic auJ:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzy;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auJ:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->alm:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/zzy;)Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzx;->zzbyj()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auJ:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzy;->zzmr(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auH:Lcom/google/android/gms/measurement/internal/zzy;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzy;->zza(Lcom/google/android/gms/measurement/internal/zzy;)Lcom/google/android/gms/measurement/internal/zzx;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->auI:Lcom/google/android/gms/measurement/internal/EventParcel;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzy$3;->alm:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzx;->zzb(Lcom/google/android/gms/measurement/internal/EventParcel;Ljava/lang/String;)V

    return-void
.end method
