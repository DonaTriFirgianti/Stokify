@extends('admin.layouts.app')

@section('title', 'Tambah Kategori Baru')

@section('content')
    <div class="bg-pink-50 rounded-2xl shadow-md p-8">
        <h2 class="text-2xl font-bold text-purple-700 mb-6">Tambah Kategori Baru</h2>

        <form action="{{ route('admin.categories.store') }}" method="POST">
            @csrf

            <div class="grid grid-cols-1 md:grid-cols-1 gap-6">
                <div>
                    <label class="block mb-2 text-sm font-medium text-purple-700">Nama Kategori</label>
                    <input type="text" name="name" required
                        class="w-full rounded-lg border border-pink-200 focus:border-purple-400 focus:ring-purple-300 shadow-sm"
                        value="{{ old('name') }}">
                    @error('name')
                        <p class="mt-1 text-sm text-red-500">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <label class="block mb-2 text-sm font-medium text-purple-700">Deskripsi</label>
                    <textarea name="description" rows="3"
                        class="w-full rounded-lg border border-pink-200 focus:border-purple-400 focus:ring-purple-300 shadow-sm">{{ old('description') }}</textarea>
                    @error('description')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror
                </div>

                <div>
                    <button type="submit" class="bg-purple-500 hover:bg-purple-600 text-white font-medium px-6 py-2 rounded-lg shadow">
                        Simpan Kategori
                    </button>
                    <a href="{{ route('admin.categories.index') }}"
                        class="bg-pink-200 hover:bg-pink-300 text-purple-800 font-medium px-5 py-2 rounded-lg shadow">
                        Batal
                    </a>
                </div>
            </div>
        </form>
    </div>
@endsection
