.class Lcom/google/android/gms/internal/zzcs$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzlw$zzc;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzcs;-><init>(Lcom/google/android/gms/internal/zzcp;Lcom/google/android/gms/internal/zzgh;)V
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


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzcs;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzcs$1;->zzaui:Lcom/google/android/gms/internal/zzcs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/internal/zzgi;)V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcs$1;->zzaui:Lcom/google/android/gms/internal/zzcs;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzcs;->zza(Lcom/google/android/gms/internal/zzcs;Z)Z

    iget-object v0, p0, Lcom/google/android/gms/internal/zzcs$1;->zzaui:Lcom/google/android/gms/internal/zzcs;

    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/zzcs;->zzc(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method

.method public synthetic zzd(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/google/android/gms/internal/zzgi;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzcs$1;->zzb(Lcom/google/android/gms/internal/zzgi;)V

    return-void
.end method
