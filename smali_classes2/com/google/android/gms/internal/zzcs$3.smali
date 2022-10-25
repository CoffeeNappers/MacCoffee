.class Lcom/google/android/gms/internal/zzcs$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzcs;->zzc(Lorg/json/JSONObject;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/zzlw$zzc",
        "<",
        "Lcom/google/android/gms/internal/zzgi;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzaui:Lcom/google/android/gms/internal/zzcs;

.field final synthetic zzauj:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcs;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcs$3;->zzaui:Lcom/google/android/gms/internal/zzcs;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzcs$3;->zzauj:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    const-string/jumbo v0, "AFMA_updateActiveView"

    iget-object v1, p0, Lcom/google/android/gms/internal/zzcs$3;->zzauj:Lorg/json/JSONObject;

    invoke-interface {p1, v0, v1}, Lcom/google/android/gms/internal/zzgi;->zza(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcs$3;->zzb(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method
