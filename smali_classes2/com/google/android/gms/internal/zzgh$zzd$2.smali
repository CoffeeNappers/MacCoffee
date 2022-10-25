.class Lcom/google/android/gms/internal/zzgh$zzd$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzgh$zzd;->zznz()Lcom/google/android/gms/internal/zzgh$zzc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

.field final synthetic zzbum:Lcom/google/android/gms/internal/zzgh$zzd;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzgh$zzd;Lcom/google/android/gms/internal/zzgh$zzc;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzgh$zzd$2;->zzbum:Lcom/google/android/gms/internal/zzgh$zzd;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzgh$zzd$2;->zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    const-string/jumbo v0, "Rejecting reference for JS Engine."

    invoke-static {v0}, Lcom/google/android/gms/internal/zzkx;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgh$zzd$2;->zzbul:Lcom/google/android/gms/internal/zzgh$zzc;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgh$zzc;->reject()V

    return-void
.end method
