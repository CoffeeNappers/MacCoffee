.class Lcom/google/android/gms/internal/zzle$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzle;->zzwb()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzcvy:I

.field final synthetic zzcvz:I

.field final synthetic zzcwa:I

.field final synthetic zzcwb:Lcom/google/android/gms/internal/zzle;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzle;III)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwb:Lcom/google/android/gms/internal/zzle;

    iput p2, p0, Lcom/google/android/gms/internal/zzle$1;->zzcvy:I

    iput p3, p0, Lcom/google/android/gms/internal/zzle$1;->zzcvz:I

    iput p4, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwa:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcvy:I

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzle;->zza(Lcom/google/android/gms/internal/zzle;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcvz:I

    if-ne p2, v0, :cond_2

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbkw:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzle;->zzb(Lcom/google/android/gms/internal/zzle;)V

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwa:I

    if-ne p2, v0, :cond_0

    sget-object v0, Lcom/google/android/gms/internal/zzdr;->zzbkx:Lcom/google/android/gms/internal/zzdn;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzdn;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzle$1;->zzcwb:Lcom/google/android/gms/internal/zzle;

    invoke-static {v0}, Lcom/google/android/gms/internal/zzle;->zzc(Lcom/google/android/gms/internal/zzle;)V

    goto :goto_0
.end method
